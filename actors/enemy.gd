extends CharacterBody2D
class_name Enemy

@onready var navigation_agent = $NavigationAgent2D
@export var target:Vector2
var health = 100

func _input(event):
	if event.is_action_pressed("roll"):
		var player = get_tree().get_first_node_in_group("player")
		navigation_agent.target_position = player.position
		print(navigation_agent.target_position)

func take_damage(n):
	health = max(health-n, 0)
	if health == 0:
		queue_free()

func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * 400
	move_and_slide()
