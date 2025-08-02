extends Camera2D

func _process(_delta):
	var player_pos = get_parent().position
	var mouse_pos = get_global_mouse_position()
	var distance = mouse_pos-player_pos
	position = lerp(Vector2.ZERO, distance, .2)
	#position = Vector2.ZERO
	
	
	
	
	
