extends KinematicBody2D

var speed : int = 200
var jumpForce : int = 600
var gravity : int = 800
var velocity : Vector2 = Vector2()
var grounded : bool = false

onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _physics_process (delta):
	velocity.x = 0
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.y  += gravity * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jumpForce
		
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
