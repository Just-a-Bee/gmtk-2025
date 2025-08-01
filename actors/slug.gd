extends Enemy


var direction = Vector2.LEFT

var bullet_packed := preload("res://actors/slug_bullet.tscn")

func _ready():
	$AnimatedSprite2D.play("walk")

func _physics_process(delta):
	if $RayCast2D.is_colliding():
		direction = -direction
		scale.x = -scale.x
	velocity = speed*direction
	move_and_slide()

func attack():
	$AnimatedSprite2D.play("attack")
	var player = get_tree().get_first_node_in_group("player")
	var bullet = bullet_packed.instantiate()
	bullet.position = $BulletSpawn.global_position
	bullet.direction = bullet.position.direction_to(player.position)
	get_parent().add_child(bullet)
	await $AnimatedSprite2D.animation_finished
	$AnimatedSprite2D.play("walk")

func _on_attack_cooldown_timeout():
	attack()
