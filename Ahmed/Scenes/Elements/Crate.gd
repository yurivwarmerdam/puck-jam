extends KinematicBody2D

export var gravity : int = 1600

export var itemName : String = "Crate"
export var isActive : bool = false

var _velocity : Vector2 = Vector2()

func _physics_process (delta):
	if isActive:
		_velocity.y += gravity * delta
		_velocity = move_and_slide(_velocity, Vector2.UP)

func destroy():
	queue_free()
	pass
