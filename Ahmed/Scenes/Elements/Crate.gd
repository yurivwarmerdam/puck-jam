extends KinematicBody2D

var itemName : String = "Crate"

func destroy():
	queue_free()
	pass
