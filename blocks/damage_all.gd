extends Block

func _init():
	text = "DamageAll(5);\n"
	tooltip = "Deals five damage to all enemies"

func execute():
	
	await make_timer(line_execute_time)
	for enemy:Enemy in main.get_tree().get_nodes_in_group("enemy"):
		enemy.take_damage(5)
	
	is_finished = true
	finished.emit()
