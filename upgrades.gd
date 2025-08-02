extends Node
# TODO: add rarity to choices
var common_array:Array[String] = [
	"res://blocks/timeout.gd",
]

var uncommon_array:Array[String] = [
	"res://blocks/all_damage_up.gd",
	"res://blocks/increase_n.gd",
	
]

var rare_array:Array[String] = [
	"res://blocks/powerup.gd",
	"res://blocks/await_take_damage.gd",
]

var upgrade_array:Array[Array] = [common_array,uncommon_array,rare_array]
var rare_chance = .9
var uncommon_chance = .6


class upgrade_option:
	var upgrade
	var rarity := 0
	var index := 0

func pick_upgrade():
	var roll := randf()
	print(roll)
	var choice = upgrade_option.new()
	if roll > rare_chance:
		choice.rarity = 2
	elif roll > uncommon_chance:
		choice.rarity = 1
	else:
		choice.rarity = 0
	choice.index = randi_range(0, upgrade_array[choice.rarity].size()-1)
	choice.upgrade = upgrade_array[choice.rarity][choice.index]
	
	return choice

func remove_from_array(choice:upgrade_option):
	upgrade_array[choice.rarity].pop_at(choice.index)
