extends StaticBody2D
class_name NPC

@export var dialogue : DialogueResource = null
@export var cue : String = ""

func _ready():
	$Sprite2D.play("default")

func interact():
	DialogueManager.show_dialogue_balloon(dialogue, cue)
