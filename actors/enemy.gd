extends CharacterBody2D
class_name Enemy

signal hit
var health = 50
var speed = 100



func take_damage(n):
	health = max(health-n-GameStats.all_damage, 0)
	hit.emit()
	if health == 0:
		die()



func die():
	get_parent().enemy_died()
	get_parent().remove_child(self)
	queue_free()
