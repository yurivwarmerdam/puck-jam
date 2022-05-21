extends TextureProgress


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if value >= max_value: value = 0
	else: value=value+1
	$TextureRect.set_rotation($TextureRect.get_rotation()+0.1)
