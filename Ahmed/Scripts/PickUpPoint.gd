extends Area2D

export(PackedScene) var scene_file; 

var _isPlayerInRange : bool = false
var _hasItemBeenPicked : bool = false

func _physics_process (delta):
	if Input.is_action_just_pressed("interact") && _isPlayerInRange && !_hasItemBeenPicked:
		get_tree().call_group("Inventory", "_onItemPickedUp", scene_file)
		_hasItemBeenPicked = true

func _on_Pick_Up_Point_body_entered(body):
	_isPlayerInRange = true

func _on_Pick_Up_Point_body_exited(body):
	_isPlayerInRange = false
