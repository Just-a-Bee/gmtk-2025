extends CharacterBody2D
class_name Enemy

@onready var navigation_agent = $NavigationAgent2D
@export var target:Vector2
@export var is_attacking := false
var health = 1
var speed = 100
var attack_range = 100


func take_damage(n):
	health = max(health-n, 0)
	if health == 0:
		die()

func _physics_process(_delta):
	
	
	
	var player = get_tree().get_first_node_in_group("player")
	handle_attack(player)
	navigation_agent.target_position = player.position
	
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * speed
	

	
	move_and_slide()

func handle_attack(player:Player):
	var player_distance = (position - player.position).length()
	$AttackArea.look_at(player.global_position)
	if player_distance < attack_range and not is_attacking:
		attack()
	

func _on_attack_area_body_entered(body):
	if body.get_parent() is Player:
		body.get_parent().take_damage(10)

func attack():
	$AnimationPlayer.play("attack")


func die():
	get_parent().enemy_died()
	get_parent().remove_child(self)
	queue_free()
