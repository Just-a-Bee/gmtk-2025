extends Block


func _init():
	text = "await PressAnyKey;\n"
	tooltip = "Execution stops until you press any key"

func execute():
	await main.key_pressed
	is_finished = true
	finished.emit()
