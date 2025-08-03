extends Block

func _init():
	text = "Random.health -= 20;\n"
	tooltip = "Deals twenty damage to a random enemy"

func execute():
	
	await make_timer(line_execute_time)
	var enemy = main.get_tree().get_nodes_in_group("enemy").pick_random()
	enemy.take_damage(20)
	
	is_finished = true
	finished.emit()
