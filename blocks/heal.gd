extends Block

func _init():
	text = "player.health += 5;\n"
	tooltip = "Heals you by five"

func execute():
	await make_timer(line_execute_time)
	main.player.health += 5
	
	is_finished = true
	finished.emit()
