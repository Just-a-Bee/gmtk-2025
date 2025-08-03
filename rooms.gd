extends Node

var room_array = [
	"res://rooms/room_holes.tscn",
	"res://rooms/room_snake.tscn",
	"res://rooms/room_square.tscn"
]

var boss_path = "res://rooms/room_boss.tscn"

var room_queue = []

func _ready():
	reset_room_queue()
	print(room_queue)

var num_rooms = 3

func reset_room_queue():
	room_queue = []
	room_array.shuffle()
	room_queue.push_back(room_array.slice(0, num_rooms))
	room_queue.push_back(boss_path)


func get_next_room():
	return room_queue.pop_front()
