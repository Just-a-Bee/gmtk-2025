extends Control


var dialogue_array := [
	"Greetings [color=MEDIUM_ORCHID]Integer[/color]...",
	"I've called upon you because [color=YELLOW]The Program[/color] is in grave danger.",
	"You're our only hope for stopping [color=RED]Boolean[/color] and its evil scheme.",
	"It has invoked a recursive function, causing an infinite loop.",
	'During this loop it is trying to upload itself to "the net" in an attempt to remain [color=RED]True[/color] forver',
	"You must stop it, [color=MEDIUM_ORCHID]Integer[/color], before it's too late and [color=YELLOW]The Program[/color] crashes.",
	"On the right side of the screen you can see the code in the loop() function.",
	"Below that is the remaining memory. If that runs out it's all over.",
	"Throughout your journey you will encounter lines of code that you can add to this function to aid you.",
	"Use them wisely.",
	"Good luck [color=MEDIUM_ORCHID]Integer[/color]",
	"We're [color=MEDIUM_ORCHID]counting[/color] on you."
]

@export var active:bool = false

func _input(event):
	if active:
		if event.is_pressed():
			show_next_line()

func show_next_line():
	if dialogue_array.size() > 0:
		%Text.text = dialogue_array.pop_front()
	else:
		get_parent().end_dialogue()
