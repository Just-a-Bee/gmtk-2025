extends Block


func _init():
	text = "await EnemyKilled;\n"
	tooltip = "Execution stops until you kill an enemy"

func execute():
	await main.enemy_killed
	is_finished = true
	finished.emit()
