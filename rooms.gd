extends Node

var room_array = [
	"res://rooms/basic_room.tscn",
	"res://rooms/basic_room.tscn"
	
	
]

func get_next_room():
	var index = randi_range(0, room_array.size()-1)
	return room_array.pop_at(index)
