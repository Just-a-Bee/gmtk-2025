extends Control
class_name ShopItem

var upgrade : PermanentUpgrade

func _ready():
	update()


func _on_purchase_pressed() -> void:
	upgrade.upgrade_index += 1
	update()


func update():
	%Name.text = upgrade.name
	%Icon.texture = upgrade.icon
	
	%Value.text = upgrade.text_before + str(upgrade.value_array[upgrade.upgrade_index]) + upgrade.text_after
	
	
	if upgrade.upgrade_index < upgrade.cost_array.size(): 
		%Cost.text = str(upgrade.cost_array[upgrade.upgrade_index])
	else:
		%Cost.text = "MAX"
		%Purchase.disabled = true
