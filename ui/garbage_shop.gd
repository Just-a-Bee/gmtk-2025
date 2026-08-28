extends PanelContainer
class_name GarbageShop

signal closed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for upgrade in GameStats.permanent_upgrades:
		%ShopItem.upgrade = upgrade
		var item : ShopItem = %ShopItem.create_instance()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func close():
	closed.emit()

func _on_button_pressed() -> void:
	close()
