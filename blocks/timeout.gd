extends Block


func _init():
	text = "await 3\n"
	tooltip = "Waits three seconds"

func execute():
	print("running a timeout block!")
	await main.get_tree().create_timer(3).timeout
	is_finished = true
	finished.emit()
