extends PanelContainer

@export var index := 0
var upgrade

func set_text(upgrade_type, description):
	%UpgradeType.text = upgrade_type
	%Body.text = description


func _on_mouse_entered():
	$Sprite2D.show()

func _on_mouse_exited():
	$Sprite2D.hide()


func _on_button_button_up():
	get_parent().get_parent().upgrade_clicked(index, upgrade)
