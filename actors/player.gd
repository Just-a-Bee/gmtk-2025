extends CharacterBody2D
class_name Player

var attack_power = 10
var defense = 10
var max_speed = 300
var attack_velocity = 300

var run_frame = 0

var acceleration = max_speed*12

@export var is_invincible := false

@export var roll_speed = 350
@export var is_rolling := false
@export var is_attacking := false

func _input(event):
	if event.is_action_pressed("roll"):
		if velocity.length() > 0 and can_roll():
			begin_roll()
	if event.is_action_pressed("attack"):
		if can_attack():
			attack()

func _physics_process(delta):
	if is_rolling:
		velocity = velocity.normalized()*roll_speed
	else: # walking
		var target_velocity = get_input_dir()*max_speed
		velocity = velocity.move_toward(target_velocity, acceleration*delta)
	move_and_slide()
	
	# temp animation
	run_frame += velocity.length()/1000
	if run_frame > 27:
		run_frame -= 27
	$Sprite2D.frame = floor(run_frame)

func get_input_dir()->Vector2:
	var dir:Vector2 = Vector2.ZERO
	dir.y = Input.get_axis("up","down")
	dir.x = Input.get_axis("left","right")
	return dir.normalized()
	

func can_roll()->bool:
	if is_attacking or is_rolling:
		return false
	return true

func begin_roll():
	$AnimationPlayer.play("roll")

func can_attack()->bool:
	if is_attacking or is_rolling:
		return false
	return true

func attack():
	var mouse_pos := get_viewport().get_mouse_position()
	var attack_dir := position.direction_to(mouse_pos)
	var attack_angle := get_angle_to(mouse_pos)
	velocity += attack_dir*attack_velocity
	%AttackHitbox.rotation = attack_angle
	$AnimationPlayer.play("attack")


func _on_attack_hitbox_body_entered(body):
	if body is Enemy:
		body.take_damage(attack_power)
