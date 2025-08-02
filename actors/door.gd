extends StaticBody2D


func unlock():
	collision_layer = 9
	print("doors unlocked")

func interact():
	get_tree().get_first_node_in_group("main").next_room()
	
