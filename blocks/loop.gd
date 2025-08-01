extends Block

func _init():
	text = "loop()\n"

func execute():
	main.calls += 1
	
	await make_timer(line_execute_time)
	main.loop()
	
	is_finished = true
	finished.emit()
