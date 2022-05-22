extends Area2D

export(String) var itemName = "Item X"
export(float) var fadeTime = 0.2

onready var _itemText : Label = $ItemName
var overrideText : String = ""

func _ready():
	_itemText.text = "Pick up " + itemName + " [E]"
	_itemText.modulate.a = 0

func _on_Item_Name_body_entered(body):
	_tween_text_visibility(0, 1)

func _on_Item_Name_body_exited(body):
	_tween_text_visibility(1, 0)

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
