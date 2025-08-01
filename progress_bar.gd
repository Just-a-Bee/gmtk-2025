extends ProgressBar

# TODO: add signal
func _process(_delta):
	var player:Player = get_tree().get_first_node_in_group("player")
	value = (float(player.health) / player.max_health) * 100
