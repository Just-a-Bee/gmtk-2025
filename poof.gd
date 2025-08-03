extends AnimatedSprite2D


func _on_animation_finished():
	get_parent().remove_child(self)
	queue_free()
