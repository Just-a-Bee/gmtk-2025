extends Block

func _init():
	text = "n += 1\n"

func execute():
	
	await make_timer(line_execute_time)
	main.n += 1
	
	is_finished = true
	finished.emit()
