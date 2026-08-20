extends Enemy


var direction:Vector2

var bullet_packed := preload("res://actors/hazards/slug_bullet.tscn")

func _ready():
	direction = Vector2.LEFT.rotated(rotation)
	$Sprite2D.play("walk")
	$AttackCooldown.start(randf_range(4,7))

func _physics_process(_delta):
	if $RayCast2D.is_colliding():
		direction = -direction
		scale.x = -scale.x
	velocity = speed*direction
	move_and_slide()

func attack():
	$Sprite2D.play("attack")
	var player = get_tree().get_first_node_in_group("player")
	var bullet = bullet_packed.instantiate()
	bullet.position = $BulletSpawn.global_position
	bullet.direction = bullet.position.direction_to(player.position)
	await get_tree().create_timer(.3).timeout
	get_parent().add_child(bullet)
	await $Sprite2D.animation_looped
	$Sprite2D.play("walk")
	$AttackCooldown.start(randf_range(4,6))

func _on_attack_cooldown_timeout():
	attack()
