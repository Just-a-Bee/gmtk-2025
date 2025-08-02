extends Block

func _init():
	text = "AllDamage += 3;\n"
	tooltip = "Increases all damage by three"

func execute():
	
	await make_timer(line_execute_time)
	GameStats.all_damage += 3
	
	is_finished = true
	finished.emit()
