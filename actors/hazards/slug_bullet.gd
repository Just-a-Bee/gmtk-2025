extends Area2D

var speed := 200
var direction := Vector2.LEFT
var damage = 10
var rotate_speed := 2

func _physics_process(delta):
	position += speed*direction*delta
	rotation += rotate_speed*delta

func _on_lifetime_timeout():
	die()

func die():
	get_parent().call_deferred("remove_child", self)
	queue_free()


func _on_body_entered(body):
	if body is TileMapLayer:
		die()
	if body.get_parent() is Player:
		body.get_parent().take_damage(damage) 
		die()
