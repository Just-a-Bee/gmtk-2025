extends Control

func _input(event):
	if event.is_pressed():
		load_main()


func load_main():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play(7.007)
