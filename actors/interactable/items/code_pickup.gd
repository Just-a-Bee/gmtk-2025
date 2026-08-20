extends StaticBody2D

func interact():
	get_parent().item_picked_up()
	
	# add code to loop()
	
	
	get_parent().remove_child(self)
	queue_free()
