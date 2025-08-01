extends Block

func _init():
	text = "attack_power += n\n\tdefense -= n\n"
	lines = 2

func execute():
	print("running a power up block!")
	
	await make_timer(line_execute_time)
	main.player.attack_power += main.n
	
	await make_timer(line_execute_time)
	main.code_window.increment_sprite_offset()
	main.player.defense -= main.n
	
	print(main.player.attack_power)
	
	is_finished = true
	finished.emit()
