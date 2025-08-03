extends NavigationRegion2D
class_name Room

var item_packed:PackedScene = preload("res://actors/code_pickup.tscn")

func _ready():
	var directions = [
		Vector2i.UP,
		Vector2i.DOWN,
		Vector2i.RIGHT,
		Vector2i.LEFT,
	]
	
	for tile in $Floor.get_used_cells():
		for dir in directions:
			if $Floor.get_cell_source_id(tile+dir) == -1:  
				$Floor.set_cell(tile+dir, 0, Vector2i(0,1))
	get_tree().get_first_node_in_group("player").position = $PlayerSpawn.position
	

var poof = preload("res://poof.tscn")
func enemy_died(dier):
	var new_particle = poof.instantiate()
	new_particle.position = dier.position
	add_child(new_particle)
	new_particle.play("default")
	
	
	get_tree().get_first_node_in_group("main").enemy_killed.emit()
	var enemies_alive = false
	for enemy in get_tree().get_nodes_in_group("enemy"):
		if enemy.health > 0: enemies_alive = true
	if not enemies_alive:
		get_tree().get_first_node_in_group("main").room_cleared()
		spawn_item()


func spawn_item():
	var item = item_packed.instantiate()
	item.position = $ItemSpawn.position
	call_deferred("add_child", item)

func item_picked_up():
	get_tree().get_first_node_in_group("main").show_upgrades()
	unlock_doors()

func unlock_doors():
	for door in get_tree().get_nodes_in_group("door"):
		door.unlock()
