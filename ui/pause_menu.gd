extends Control
class_name PauseMenu

@onready var main : Main = get_parent()
@onready var settings : SettingsMenu = $SettingsMenu
var is_settings_open : bool = false

func _input(event:InputEvent)->void:
	if event.is_action_pressed("pause"):
		toggle_pause()

func toggle_pause():
	if is_settings_open:
		settings.close()
	elif visible:
		hide()
		get_tree().paused = false
	elif not visible and not get_tree().paused:
		show()
		get_tree().paused = true

func _on_settings_pressed() -> void:
	settings.open()
	is_settings_open = true


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/title.tscn")


func _on_resume_pressed() -> void:
	toggle_pause()


func _on_settings_menu_closed() -> void:
	is_settings_open = false
