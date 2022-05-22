extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func playJump():
	var rand = rand_range(0,99)
	if(rand < 99):
		$AudioJump2.set_pitch_scale(0.75 + (0.5 * randf()))
		$AudioJump2.play()
	else:
		$AudioJump3.set_pitch_scale(1.25 + (0.1 * randf()))
		$AudioJump3.play()

func playLand():
	$AudioLand.set_pitch_scale(0.75 + (0.5 * randf()))
	$AudioLand.play()

func playRun():
	#$AudioRun.play()
	pass

func stopRun():
	#$AudioRun.stop()
	pass
