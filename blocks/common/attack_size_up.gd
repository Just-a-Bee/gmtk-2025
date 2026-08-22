extends Block

func _init():
	text = "Player.AttackSize += 5;\n"
	tooltip = "Increases your attack size by 5%"

func execute():
	
	await make_timer(line_execute_time)
	main.player.get_node("AttackHitbox").scale += Vector2(.05,.05)
	
	is_finished = true
	finished.emit()
