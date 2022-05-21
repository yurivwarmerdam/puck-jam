extends Control

onready var button_l = $HBoxContainer/ui_frame_L/VBoxContainer/HBoxContainer/button
onready var button_r = $HBoxContainer/ui_frame_L/VBoxContainer/HBoxContainer/button2
onready var button_d = $HBoxContainer/ui_frame_L/VBoxContainer/button

func _ready():
	button_l.connect("button_down",self,"on_button_left")
	button_r.connect("button_down",self,"on_button_right")
	button_d.connect("button_down",self,"on_button_down")

func on_button_left():
	print("left!")
func on_button_right():
	print("right!")
func on_button_down():
	print("down!")
