extends CharacterBody2D
class_name Enemy

@onready var navigation_agent = $NavigationAgent2D
@export var target:Vector2
var health = 100
var speed = 100


func take_damage(n):
	health = max(health-n, 0)
	if health == 0:
		queue_free()

func _physics_process(_delta):
	var player = get_tree().get_first_node_in_group("player")
	navigation_agent.target_position = player.position
	
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * speed
	
	$AttackArea.rotation = get_angle_to(player.position)
	
	move_and_slide()


func _on_attack_area_body_entered(body):
	if body.get_parent() is Player:
		attack()

func attack():
	print("hi ya")
