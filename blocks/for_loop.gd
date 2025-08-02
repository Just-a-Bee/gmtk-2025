extends Block

func _init():
	text = "for (int i = 0; i < 5; i++)\n\t"
	tooltip = "Repeats the next line five times"

var repeats := 5

func execute():
	
	await make_timer(line_execute_time)
	
	for i in repeats:
		var block:Block = main.loop_arr[main.current_block + 1]
		block.execute()
		if not block.is_finished:
			await block.finished
		block.reset()
	
	is_finished = true
	finished.emit()
