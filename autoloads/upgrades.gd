extends Node

# 2d array [rarity][index]
var upgrade_arrays:Array[Array] = []

const rarity_names : Array[String] = [
	"common",
	"uncommon",
	"rare"
]

var rarity_chances = [
	75, # common
	20, # uncommon
	5 # rare
]

const upgrades_shown := 3

func _ready():
	populate_upgrade_arrays()

func populate_upgrade_arrays():
	for rarity in rarity_names:
		var dir :=  DirAccess.open("res://blocks/" + rarity)
		var upgrades : Array[String] = []
		if dir:
			dir.list_dir_begin()
			var file_name := dir.get_next()
			while file_name != "":
				if not file_name.contains(".uid"):
					upgrades.push_back("res://blocks/" + rarity + "/" + file_name)
				file_name = dir.get_next()
		upgrade_arrays.push_back(upgrades)



class UpgradeOption:
	var upgrade_path
	var index := 0
	var rarity := 0

func pick_upgrades()->Array[UpgradeOption]:
	var choices : Array[UpgradeOption] = []
	
	for i in upgrades_shown:
		var rarity := random_rarity()
		var choice := UpgradeOption.new()
		var upgarde_index := randi_range(0,upgrade_arrays[rarity].size()-1)
		choice.index = i
		choice.rarity = rarity
		choice.upgrade_path = upgrade_arrays[rarity][upgarde_index]
		choices.push_back(choice)
	return choices

func random_rarity()->int:
	var roll := randi_range(1,100)
	var rarity := 0
	while roll > rarity_chances[rarity]:
		roll -= rarity_chances[rarity]
		rarity += 1
	print("Rarity chosen: ", rarity)
	return rarity

func remove_path(path:String, rarity : int):
	upgrade_arrays[rarity].erase(path)
