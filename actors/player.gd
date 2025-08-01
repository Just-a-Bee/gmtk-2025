extends CharacterBody2D
class_name Player


var attack_power = 10
var defense = 10
@export var max_speed = 300
var attack_velocity = 400

@export var run_frame = 0

var acceleration = max_speed*12

@export var is_invincible := false

@export var roll_speed = 350
@export var is_rolling := false
@export var is_attacking := false

func _input(event):
	if event.is_action_pressed("roll"):
		if can_roll():
			begin_roll()
	if event.is_action_pressed("attack"):
		if can_attack():
			attack()

func _physics_process(delta):
	if is_rolling:
		velocity = velocity.normalized()*roll_speed
		move_and_collide(velocity*delta)
	else: # walking
		var target_velocity = get_input_dir()*max_speed
		velocity = velocity.move_toward(target_velocity, acceleration*delta)
		# animaiton
		run_frame += velocity.length()/400
		if run_frame > 27:
			run_frame -= 27
		move_and_slide()
	
	print(velocity.y)
	# update sprite frame
	%Sprite2D.frame_coords.x = floor(run_frame)
	if velocity.y > 200 and velocity.y > abs(velocity.x):
		%Sprite2D.frame_coords.y = 1
	elif velocity.y < -200 and abs(velocity.y) > abs(velocity.x):
		%Sprite2D.frame_coords.y = 2
	elif abs(velocity.x) > 100:
		%Sprite2D.frame_coords.y = 0
	if velocity.x > 100:
		%Sprite2D.scale.x = .4
	if velocity.x < -100:
		%Sprite2D.scale.x = -.4
	
	
	# update sword pos
	# TODO: make sword show under player when up
	var mouse_pos := get_global_mouse_position()
	var sword_angle := get_angle_to(mouse_pos)
	var sword_offset_x = 32
	var sword_offset_y = 16
	
	%SwordOrigin.position = Vector2(cos(sword_angle)*sword_offset_x, 64+sin(sword_angle)*sword_offset_y)
	%SwordOrigin.get_child(0).rotation_degrees = lerp(0, 40, cos(sword_angle))
	
	

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
	var mouse_pos := get_global_mouse_position()
	velocity = position.direction_to(mouse_pos)
	$AnimationPlayer.play("roll")

func can_attack()->bool:
	if is_attacking or is_rolling:
		return false
	return true

func attack():
	var mouse_pos := get_viewport().get_mouse_position()
	var attack_dir := position.direction_to(mouse_pos)
	var attack_angle := get_angle_to(mouse_pos)
	velocity = attack_dir*attack_velocity
	%AttackHitbox.rotation = attack_angle
	$AnimationPlayer.play("attack")


func _on_attack_hitbox_body_entered(body):
	if body.get_parent() is Enemy:
		body.get_parent().take_damage(attack_power)
