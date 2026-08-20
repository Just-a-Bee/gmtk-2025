extends Room


func _ready():
	item_packed = preload("res://actors/interactable/items/code_pickup.tscn")
	
	get_tree().get_first_node_in_group("main").change_music_to_boss()
	
	super._ready()

func enemy_died(enemy):
	super.enemy_died(enemy)
	get_tree().get_first_node_in_group("main").room_cleared()
	spawn_item()

func item_picked_up():
	get_tree().get_first_node_in_group("main").show_deleter()
