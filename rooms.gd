extends Node

var room_array = [
	"res://rooms/room_holes.tscn",
	"res://rooms/room_snake.tscn",
	"res://rooms/room_square.tscn"
]

var boss_path = "res://rooms/room_boss.tscn"

func get_next_room():
	var index = randi_range(0, room_array.size()-1)
	return room_array.pop_at(index)
