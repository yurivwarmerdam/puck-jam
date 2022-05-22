extends Area2D

export(String) var itemName = "Item X"
export(float) var fadeTime = 0.2
export(PackedScene) var scene_file; 

onready var _itemText : Label = $ItemName

var _isPlayerInRange : bool = false
var _hasItemBeenPicked : bool = false

func _ready():
	_itemText.text = "Pick up " + itemName + " [E]"
	_itemText.modulate.a = 0

func _physics_process (delta):
	if Input.is_action_just_pressed("interact") && _isPlayerInRange && !_hasItemBeenPicked:
		get_tree().call_group("Inventory", "_onItemPickedUp", scene_file)
		#_hasItemBeenPicked = true

func _on_Pick_Up_Point_body_entered(body):
	_tween_text_visibility(0, 1)
	_isPlayerInRange = true

func _on_Pick_Up_Point_body_exited(body):
	_tween_text_visibility(1, 0)
	_isPlayerInRange = false

func _tween_text_visibility(startValue, endValue):
	var startColor : Color = _itemText.modulate
	var endColor : Color = _itemText.modulate
	startColor.a = startValue
	endColor.a = endValue
	
	$Tween.interpolate_property(
		_itemText, 
		"modulate",
		startColor, 
		endColor, 
		fadeTime,
		Tween.TRANS_LINEAR, 
		Tween.EASE_IN_OUT
	)
	
	$Tween.start()
