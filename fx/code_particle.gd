extends Node2D

@onready var label : Label = %Label
var text := ""
var velocity:Vector2
var decel = 100

func _ready():
	initialize()

func initialize():
	label.text = text
	if text == "loop();\n":
		label.add_theme_color_override("font_color", Color.RED)
	
	await get_tree().process_frame
	$PanelContainer.position = -$PanelContainer.size/2
	$AnimationPlayer.play("appear")

func _on_timer_timeout() -> void:
	$AnimationPlayer.play_backwards("appear")
	await $AnimationPlayer.animation_finished
	queue_free()

func _process(delta):
	position += velocity*delta
	velocity.move_toward(Vector2.ZERO, delta*decel)
