extends Block


func _init():
	text = "await n\n"

func execute():
	print("running a timeout block!")
	await main.get_tree().create_timer(main.n).timeout
	is_finished = true
	finished.emit()
