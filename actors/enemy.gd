extends CharacterBody2D
class_name Enemy

signal hit
var health = 50
var speed = 100
var flash := 0.0


func take_damage(n):
	health = max(health-n-GameStats.all_damage, 0)
	hit.emit()
	if health == 0:
		die()
	flash = 1


func _process(delta):
	flash = max(flash-delta*3,0)
	$Sprite2D.material.set_shader_parameter("flash", flash)

func die():
	get_parent().enemy_died()
	get_parent().remove_child(self)
	queue_free()
