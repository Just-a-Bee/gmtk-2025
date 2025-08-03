extends Block

func _init():
	text = "Player.damage += 3;\n"
	tooltip = "Permanently increases your attack power by three"

func execute():
	await make_timer(line_execute_time)
	main.player.damage += 1
	print(main.player.damage)
	
	is_finished = true
	finished.emit()
