extends Block

func _init():
	text = "Player.speed += 15;\n"
	tooltip = "Permanently increases your speed"

func execute():
	
	await make_timer(line_execute_time)
	main.player.speed_increase += 15
	
	is_finished = true
	finished.emit()
