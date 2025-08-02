extends Block

func _init():
	text = "attack_power += 1\n"
	tooltip = "Permanently increases your attack power by one"

func execute():
	await make_timer(line_execute_time)
	GameStats.player_attack_power += 1
	
	is_finished = true
	finished.emit()
