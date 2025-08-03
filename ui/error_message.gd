extends PanelContainer

func _ready():
	%Label.text = "[color=BLUE][font_size=25]Stack Overflow
	
	[color=BLACK][font_size=20]An infinite loop repeated too many times. Please restart the program"

func show_death_message():
	%Label.text = '[color=BLUE][font_size=25]Assignment Error
	
	[color=BLACK][font_size=20]Attempted to assign value of "5" to unknown data type <integer>. Please restart the program.'

func show_wrong_delete():
	%Label.text = "[color=BLUE][font_size=25]Why Did You Do That

[color=BLACK][font_size=20]That was your chance to save the program and you blew it!! Please DON'T restart the program."


# TODO: THIS DOESNT RESET SINGLETONS!!!!!!!!!!!!!!!!!!!1

func _on_quit_button_up():
	get_tree().paused = false
	Rooms.reset_room_queue()
	GameStats.reset()
	get_tree().change_scene_to_file("res://ui/title.tscn")


func _on_retry_button_up():
	get_tree().paused = false
	Rooms.reset_room_queue()
	GameStats.reset()
	get_tree().change_scene_to_file("res://main.tscn")
