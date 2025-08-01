# block contains code for the loop function

class_name Block

const line_execute_time := .5

var main

var text = "this is a block of code\n"
var lines := 1
var current_line := 0
var is_finished := false
signal finished

func execute():
	is_finished = true
	finished.emit()

func make_timer(time):
	return main.get_tree().create_timer(time).timeout

func reset():
	current_line = 0
	is_finished = false
