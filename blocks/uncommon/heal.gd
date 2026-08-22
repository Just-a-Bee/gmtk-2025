extends Block

func _init():
	text = "Player.health += 5;\n"
	tooltip = "Heals you by five"

func execute():
	await make_timer(line_execute_time)
	main.player.health += 5
	if main.player.health > 100:
		main.player.health = 100
	
	is_finished = true
	finished.emit()
