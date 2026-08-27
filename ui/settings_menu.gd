extends PanelContainer
class_name SettingsMenu

signal closed

func open():
	visible = true

func close():
	visible = false
	closed.emit()


func _on_back_button_pressed() -> void:
	close()
