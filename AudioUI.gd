extends Node

func _ready():
	pass

func playPhoneButtonClick():
	$AudioPhoneButtonClick.set_pitch_scale(0.75 + (0.5 * randf()))
	$AudioPhoneButtonClick.play()

func playPhoneRing():
	var rand = rand_range(0, 99)
	if(rand < 33):
		$AudioPhoneRing1.set_pitch_scale(0.9 + (0.2 * randf()))
		$AudioPhoneRing1.play()
	else: if(rand < 66):
		$AudioPhoneRing2.set_pitch_scale(0.9 + (0.2 * randf()))
		$AudioPhoneRing2.play()
	else:
		$AudioPhoneRing3.set_pitch_scale(0.9 + (0.2 * randf()))
		$AudioPhoneRing3.play()
