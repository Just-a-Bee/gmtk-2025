extends Control

func _ready():
	$AnimationPlayer.play("default")
	

func _on_back_to_title_button_up():
	get_tree().paused = false
	Rooms.reset_room_queue()
	GameStats.reset()
	Upgrades.reset_upgrade_queue()
	get_tree().change_scene_to_file("res://ui/title.tscn")
