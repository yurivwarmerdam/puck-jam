extends KinematicBody2D

export var gravity : int = 1600

export var itemName : String = "Crate"
export var isActive : bool = false

onready var collisionShape : Area2D = $Area2D
var _velocity : Vector2 = Vector2()

func _physics_process (delta):
	if isActive:
		_velocity.y += gravity * delta
		_velocity = move_and_slide(_velocity, Vector2.UP)
		
		var collidingBodies : Array = collisionShape.get_overlapping_bodies()
		for body in collidingBodies:
			if body.name == "Player":
				if Input.is_action_just_pressed("interact"):
					isActive = false
					get_tree().call_group("Inventory", "_onItemPickedUp", self)

func destroy():
	queue_free()
	pass
