extends Node

var garbage_data := 0

var all_damage := 0

var permanent_upgrades : Array[PermanentUpgrade]


func _ready():
	permanent_upgrades.push_back(load("res://resource/reinitialize.tres"))
	permanent_upgrades.push_back(load("res://resource/max_HP.tres"))

func load_game():
	pass


func reset():
	all_damage = 0
