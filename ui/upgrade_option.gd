extends PanelContainer

@export var index := 0
var upgrade

func set_upgrade(upgrade, rarity):
	%UpgradeType.text = upgrade.type
	%Body.text = upgrade.tooltip
	%RarityText.text = Upgrades.rarity_names[rarity]
	self.upgrade = upgrade


func _on_mouse_entered():
	$Sprite2D.show()

func _on_mouse_exited():
	$Sprite2D.hide()


func _on_button_button_up():
	get_parent().get_parent().upgrade_clicked(index, upgrade)
