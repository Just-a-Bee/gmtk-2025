extends Control
class_name Main

signal enemy_killed
signal key_pressed

var timeout := "res://blocks/timeout.gd"
var powerup := "res://blocks/damage_random.gd"
var increase_n := "res://blocks/damage_all.gd"
var loop_path := "res://blocks/loop.gd"
var for_loop_path := "res://blocks/for_loop.gd"

@onready var player:Player = %Player
@onready var code_window:CodeWindow = %CodeWindow

var stack_count:int = 0
var n:int = 1
var loop_arr:Array[Block] = []
var num_upgrades = 3
var do_execute_loop := false

func _ready():
	#add_block(load(increase_n).new())
	#add_block(load("res://blocks/for_loop.gd").new())
	#add_block(load(powerup).new())
	add_block(load(timeout).new())
	add_block(load(loop_path).new())
	update_text()
	
	%Player.interactible_entered.connect(show_interact_prompt)
	%Player.interactible_left.connect(hide_interact_prompt)

func _input(event):
	if event.is_pressed():
		key_pressed.emit()

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
	if stack_count > 16:
		lose()
	if do_execute_loop:
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
	upgrades_shown.clear()
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

func room_cleared():
	do_execute_loop = false
	code_window.pause()

func next_room():
	# play some sort of fade out animation
	var room = get_tree().get_first_node_in_group("room")
	room.get_parent().remove_child(room)
	room.queue_free()
	var new_room = Rooms.get_next_room()
	new_room = load(new_room).instantiate()
	$SubViewportContainer/SubViewport/Node2D.add_child(new_room)
	player.position = new_room.get_node("PlayerSpawn").position
	do_execute_loop = true
	code_window.unpause()
	loop()
	
	# play a fade in

var boss
func show_boss_bar(b:Enemy):
	boss = b
	$BossBar.show()
	$BossBar.max_value = boss.health
	$BossBar.value = boss.health
	boss.hit.connect(self._on_boss_hit)
func _on_boss_hit():
	$BossBar.value = boss.health
	

func show_interact_prompt():
	%InteractAnimator.play("show")

func hide_interact_prompt():
	%InteractAnimator.play("hide")



func lose(player_died := false, wrong_delete := false):
	if wrong_delete:
		%ErrorMessage.show_wrong_delete()
	elif player_died:
		%ErrorMessage.show_death_message()
	
	do_execute_loop = false
	get_tree().paused = true
	$AnimationPlayer.play("show_error")


func _on_player_die():
	lose(true)

func show_deleter():
	get_tree().paused = true
	$UpgradeMenu.show_deleter()
	$AnimationPlayer.play("show_upgrades")
