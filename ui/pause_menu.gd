extends Control
class_name PauseMenu

@onready var main : Main = get_parent()
@onready var settings : SettingsMenu = $SettingsMenu
@onready var garbage : GarbageShop = $GarbageShop
var is_settings_open : bool = false
var is_garbage_open : bool = false

func _ready()->void:
	NpcManager.open_shop.connect(open_garbage)

func _input(event:InputEvent)->void:
	if event.is_action_pressed("pause"):
		toggle_pause()

func toggle_pause():
	if is_garbage_open:
		garbage.close()
	elif is_settings_open:
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

func open_garbage():
	toggle_pause()
	$PausePanel.hide()
	garbage.show()
	is_garbage_open = true


func _on_garbage_shop_closed() -> void:
	$PausePanel.show()
	garbage.hide()
	is_garbage_open = false
	toggle_pause()
