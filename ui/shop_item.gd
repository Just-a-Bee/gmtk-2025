extends Control
class_name ShopItem

var upgrade : PermanentUpgrade

func _ready():
	update()


func _on_purchase_pressed() -> void:
	GameStats.garbage_data -= get_current_cost()
	GameStats.increment_upgrade(upgrade)
	update()

func get_current_cost()->int:
	return upgrade.cost_array[upgrade.upgrade_index]


func update():
	%Name.text = upgrade.name
	%Icon.texture = upgrade.icon
	
	%Value.text = upgrade.text_before + str(upgrade.value_array[upgrade.upgrade_index]) + upgrade.text_after
	
	
	if upgrade.upgrade_index < upgrade.cost_array.size(): 
		%Cost.text = str(get_current_cost())
		if get_current_cost() > GameStats.garbage_data:
			%Purchase.disabled = true
		else:
			%Purchase.disabled = false
	else:
		%Cost.text = "MAX"
		%Purchase.disabled = true
		
