extends Block


func _init():
	text = "await time(3);\n"
	tooltip = "Waits three seconds"

func execute():
	await main.get_tree().create_timer(3).timeout
	is_finished = true
	finished.emit()
