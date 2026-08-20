extends Enemy



var is_on := true


func reset():
	is_on = true
	$Label.text = "1"
	$Sprite2D.modulate = Color.RED
	add_to_group("enemy")

func take_damage(_n):
	is_on = false
	$Label.text = "0"
	$Sprite2D.modulate = Color.GREEN
	hit.emit()
	remove_from_group("enemy")
