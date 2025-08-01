extends PanelContainer
class_name CodeWindow

var indicator_origin_y = 32
var line_offset = 40

func get_loop_text():
	return %Loop.text

func set_loop_text(text:String):
	%Loop.text = text

func set_sprite_offset(line:int):
	%Indicator.position.y = indicator_origin_y + line_offset*line

func increment_sprite_offset():
	%Indicator.position.y += line_offset
