extends Node

var garbage_data := 200

var all_damage := 0

var permanent_upgrades : Array[PermanentUpgrade]

enum upgrade_types {
	reinitialize = 0,
	max_HP = 1
}


func _ready():
	## change to be based on enum
	permanent_upgrades.push_back(load("res://resource/reinitialize.tres"))
	permanent_upgrades.push_back(load("res://resource/max_HP.tres"))

func load_game():
	pass


func reset():
	all_damage = 0

func increment_upgrade(upgrade:PermanentUpgrade):
	upgrade.upgrade_index += 1
