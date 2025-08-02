extends Control
class_name Main

var timeout := "res://blocks/timeout.gd"
var powerup := "res://blocks/powerup.gd"
var increase_n := "res://blocks/increase_n.gd"
var loop_path := "res://blocks/loop.gd"

@onready var player:Player = %Player
@onready var code_window:CodeWindow = %CodeWindow

var stack_count:int = 0
var n:int = 1
var loop_arr:Array[Block] = []
var num_upgrades = 3


func _ready():
	add_block(load(increase_n).new())
	add_block(load(powerup).new())
	add_block(load(timeout).new())
	add_block(load(loop_path).new())
	update_text()
	loop()

var current_block := 0

func loop():
	var block = loop_arr[current_block]
	code_window.increment_sprite_offset()
	block.execute()
	if not block.is_finished:
		await block.finished
	block.reset()
	current_block += 1
	if current_block >= loop_arr.size():
		current_block = 0
		code_window.set_sprite_offset(0)
		await get_tree().create_timer(Block.line_execute_time).timeout
	loop()


func add_block(block:Block, index = -1):
	if index == -1:
		index = loop_arr.size()
	block.main = self
	loop_arr.insert(index, block)
	update_text()

func update_text():
	var text := "[color=GREEN]void loop():\n"
	for block:Block in loop_arr:
		text += "\t" + block.text
	code_window.set_loop_text(text)

func increment_stack_count():
	stack_count += 1
	code_window.set_stack_count(stack_count)


var upgrades_shown:Array = []
func show_upgrades():
	for i in num_upgrades:
		upgrades_shown.push_back(Upgrades.pick_upgrade())
		$UpgradeMenu.display_upgrade(i, load(upgrades_shown[i].upgrade).new())
	$AnimationPlayer.play("show_upgrades")
	get_tree().paused = true

func select_upgrade(index, object, insert_index):
	Upgrades.remove_from_array(upgrades_shown[index])
	if object is Block:
		add_block(object, insert_index)
	$AnimationPlayer.play("hide_upgrades")
	await $AnimationPlayer.animation_finished
	get_tree().paused = false
