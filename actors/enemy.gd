extends CharacterBody2D
class_name Enemy


var health = 1
var speed = 100



func take_damage(n):
	health = max(health-n, 0)
	if health == 0:
		die()



func die():
	get_parent().enemy_died()
	get_parent().remove_child(self)
	queue_free()
