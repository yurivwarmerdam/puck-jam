extends KinematicBody2D

export var speed : int = 200
export var jumpForce : int = 600
export var gravity : int = 1600
export var coyoteTime : float = 0.1

onready var sprite = $Sprite
onready var _animationPlayer = $AnimationPlayer

enum PlayerState { RUNNING, IN_AIR, IDLE }

var _velocity : Vector2 = Vector2()
var _state;
var _timeInAir : float = 0;

func _updateAnimationState(newState):
	if _state == newState:
		pass
	else:
		_state = newState
		
		match _state:
			PlayerState.IDLE:
				_animationPlayer.play("Idle")
			PlayerState.RUNNING:
				_animationPlayer.play("Run")
			PlayerState.IN_AIR:
				_animationPlayer.play("Jump_Up")

func _ready():
	_updateAnimationState(PlayerState.IDLE)

func _physics_process (delta):
	_velocity.x = 0
	_velocity.y += gravity * delta
	_timeInAir += delta
	
	# Horizontal movement
	if Input.is_action_pressed("move_left"):
		_velocity.x -= speed
		
		if _state == PlayerState.IDLE:
			_updateAnimationState(PlayerState.RUNNING)
			$Audio.playRun()
		
	if Input.is_action_pressed("move_right"):
		_velocity.x += speed
		
		if _state == PlayerState.IDLE:
			_updateAnimationState(PlayerState.RUNNING)
			$Audio.playRun()
		
	_velocity = move_and_slide(_velocity, Vector2.UP)
	
	# Vertical movement
	if is_on_floor():
		if _state == PlayerState.IN_AIR:
			_updateAnimationState(PlayerState.IDLE)
			$Audio.playLand()
	else:
		if _timeInAir > coyoteTime:
			if _state != PlayerState.IN_AIR:
				_timeInAir = 0;
			
			if _velocity.y > 0 && _state == PlayerState.IN_AIR:
				_animationPlayer.play("Jump_Down")	
				
			_updateAnimationState(PlayerState.IN_AIR)
			$Audio.stopRun()
	
	if Input.is_action_just_pressed("jump") && (_state != PlayerState.IN_AIR || _timeInAir < coyoteTime):
		_velocity.y = -jumpForce
		
		if _state != PlayerState.IN_AIR:
			_timeInAir = 0 
			
		_updateAnimationState(PlayerState.IN_AIR)
		$Audio.stopRun()
		$Audio.playJump()

		
	if Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
		if _state != PlayerState.IN_AIR:
			_updateAnimationState(PlayerState.IDLE)
			$Audio.stopRun()
		
	if _velocity.x < 0:
		sprite.flip_h = true
	elif _velocity.x > 0:
		sprite.flip_h = false
		
