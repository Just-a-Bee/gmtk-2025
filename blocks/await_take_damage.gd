extends Block


func _init():
	text = "await PlayerTakeDamage;\n"
	tooltip = "Execution stops until you take damage"

func execute():
	await main.player.damage_taken
	is_finished = true
	finished.emit()
