extends Enemy


@export var booleans:Array[Enemy] = []
var projectile_packed := preload("res://actors/slug_bullet.tscn")
var BULLET_DIST = 50
var is_forcefield_up = true

func _ready():
	health = 300
	get_tree().get_first_node_in_group("main").show_boss_bar(self)
	for b in booleans:
		b.hit.connect(self._on_boolean_hit)

func _physics_process(delta):
	pass
	
	
	


func circle_attack():
	var rand_angle = randf_range(0, 2*PI)
	for i in 12:
		var bullet = projectile_packed.instantiate()
		var bullet_offset = Vector2.LEFT.rotated(rand_angle + i * PI/6)*BULLET_DIST
		bullet.position = position + bullet_offset
		bullet.direction = bullet_offset.normalized()
		get_parent().add_child(bullet)


func raise_forcefield():
	$Forcefield.show()
	collision_layer = 2
	is_forcefield_up = true
	for b in booleans:
		b.reset()

func lower_forcefield():
	$Forcefield.hide()
	collision_layer = 6
	$ForcefieldTimer.start()
	is_forcefield_up = false


func _on_attack_timer_timeout():
	circle_attack()

func _on_boolean_hit():
	var all_hit = true
	for b in booleans:
		if b.is_on:
			all_hit = false
	if all_hit:
		lower_forcefield()


func _on_forcefield_timer_timeout():
	raise_forcefield()
