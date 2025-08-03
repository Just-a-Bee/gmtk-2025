extends StaticBody2D
class_name NPC

func interact():
	get_tree().get_first_node_in_group("main").play_dialogue()
	
	
