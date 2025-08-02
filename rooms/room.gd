extends NavigationRegion2D
class_name Room

var item_packed:PackedScene = preload("res://actors/code_pickup.tscn")

func enemy_died():
	var enemies_alive = false
	for enemy in get_tree().get_nodes_in_group("enemy"):
		if enemy.health > 0: enemies_alive = true
	if not enemies_alive:
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
