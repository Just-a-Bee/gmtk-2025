extends Node2D
class_name Main

var timeout := "res://blocks/timeout.gd"
var powerup := "res://blocks/powerup.gd"
var increase_n := "res://blocks/increase_n.gd"
var loop_path := "res://blocks/loop.gd"

@onready var player:Player = %Player
@onready var code_window:CodeWindow = $CodeWindow

var stack_count:int = 0
var n:int = 1
var loop_arr:Array[Block] = []

func _ready():
	add_block(increase_n)
	add_block(powerup)
	add_block(timeout)
	add_block(loop_path)
	update_text()
	loop()

func loop():
	code_window.set_sprite_offset(0)
	for block:Block in loop_arr:
		code_window.increment_sprite_offset()
		block.execute()
		if not block.is_finished:
			await block.finished
		
		block.reset()

func add_block(script:String):
	var block:Block = load(script).new()
	block.main = self
	loop_arr.push_back(block)

func update_text():
	var text := "void loop():\n"
	for block:Block in loop_arr:
		text += "\t" + block.text
	code_window.set_loop_text(text)

func increment_stack_count():
	stack_count += 1
	code_window.set_stack_count(stack_count)
