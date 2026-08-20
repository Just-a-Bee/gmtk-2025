extends StaticBody2D


func unlock():
	collision_layer = 9
	print("doors unlocked")

func interact():
	$Sprite2D.play("default")
	await get_tree().create_timer(1).timeout
	get_tree().get_first_node_in_group("main").next_room()
	
