extends KinematicBody2D

export var speed : int = 200
export var jumpForce : int = 600
export var gravity : int = 1600
export var canDoubleJump : bool = false

var _velocity : Vector2 = Vector2()
var _isGrounded : bool = false

onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _physics_process (delta):
	_velocity.x = 0
	
	if Input.is_action_pressed("move_left"):
		_velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		_velocity.x += speed
	
	_velocity = move_and_slide(_velocity, Vector2.UP)
	_velocity.y  += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		_velocity.y -= jumpForce
		
	if _velocity.x < 0:
		sprite.flip_h = true
	elif _velocity.x > 0:
		sprite.flip_h = false
