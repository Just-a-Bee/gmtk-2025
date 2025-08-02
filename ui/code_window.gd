extends PanelContainer
class_name CodeWindow

var indicator_origin_y = 27
var line_offset = 24
var stack_max = 16

func set_loop_text(text:String):
	%Loop.text = text

func set_sprite_offset(line:int):
	%Indicator.position.y = indicator_origin_y + line_offset*line

func increment_sprite_offset():
	%Indicator.position.y += line_offset
func decrement_sprite_offset():
	%Indicator.position.y -= line_offset

func set_stack_count(count:int):
	%StackLabel.text = str(count) + "/" + str(stack_max)
	%StackBars.text = "[color=RED]" + "|".repeat(count) + "[/color]" + "|".repeat(stack_max-count)
	

func pause():
	$PausePanel.show()
func unpause():
	$PausePanel.hide()
