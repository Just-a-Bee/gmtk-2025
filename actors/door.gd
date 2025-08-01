extends StaticBody2D


func unlock():
	collision_layer = 9
	print("doors unlocked")

func interact():
	print("You clikced on a door")
	
