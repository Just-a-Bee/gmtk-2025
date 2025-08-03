extends PanelContainer

func show_death_message():
	%Label.text = ""
	


# TODO: THIS DOESNT RESET SINGLETONS!!!!!!!!!!!!!!!!!!!1

func _on_quit_button_up():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/title.tscn")


func _on_retry_button_up():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main.tscn")
