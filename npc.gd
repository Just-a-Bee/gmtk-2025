extends StaticBody2D
class_name NPC

func _ready():
	$Sprite2D.play("default")

func interact():
	get_tree().get_first_node_in_group("main").play_dialogue()
	
	
