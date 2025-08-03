extends Node
# TODO: add rarity to choices
var upgrade_array:Array[String] = [
	"res://blocks/timeout.gd",
	"res://blocks/speedup.gd",
	"res://blocks/heal.gd",
	"res://blocks/await_any_key_pressed.gd",
	"res://blocks/damage_random.gd",
	"res://blocks/await_take_damage.gd",
	"res://blocks/for_loop.gd",
	"res://blocks/damage_up.gd",
	"res://blocks/all_damage_up.gd",
	"res://blocks/attack_size_up.gd",
	"res://blocks/await_enemy_killed.gd",
	"res://blocks/damage_all.gd"
]

var upgrade_queue = []

func _ready():
	reset_upgrade_queue()

func reset_upgrade_queue():
	upgrade_queue = upgrade_array
	upgrade_queue.shuffle()


class upgrade_option:
	var upgrade
	var index := 0

func pick_upgrades():
	var choices = []
	
	for i in 3:
		print(i)
		var choice = upgrade_option.new()
		choice.index = i
		choice.upgrade = upgrade_queue[i]
		choices.push_back(choice)
	return choices

func remove_from_array(choice:upgrade_option):
	upgrade_queue.pop_at(choice.index)
	upgrade_queue.shuffle()
