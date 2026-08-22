extends Block

func _init():
	text = "for int i in 5:\n\t"
	tooltip = "Repeats the next line five times"
	collect_only_once = true

var repeats := 4

func execute():
	for i in repeats:
		await make_timer(line_execute_time)
		if not main.do_execute_loop:
			return
		main.code_window.increment_sprite_offset()
		
		
		
		if main.loop_arr[main.current_block] != self:
			return
		
		var block:Block = main.loop_arr[main.current_block + 1]
		block.execute()
		if not block.is_finished:
			await block.finished
		block.reset()
		main.code_window.decrement_sprite_offset()
	await make_timer(line_execute_time)
	is_finished = true
	finished.emit()
