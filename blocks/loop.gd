extends Block

func _init():
	text = "loop();\n"

func execute():
	main.increment_stack_count()
	
	await make_timer(line_execute_time)
	
	is_finished = true
	finished.emit()
