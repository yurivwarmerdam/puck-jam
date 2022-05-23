extends Area2D

export(PackedScene) var scene_file; 

var _isPlayerInRange : bool = false

func _physics_process (delta):
	if Input.is_action_just_pressed("interact") && _isPlayerInRange:
		var instancedItem : Node2D = scene_file.instance()
		get_tree().call_group("Inventory", "_onItemPickedUp", instancedItem)

func _on_Pick_Up_Point_body_entered(body):
	if body.name == "Player":
		_isPlayerInRange = true

func _on_Pick_Up_Point_body_exited(body):
	if body.name == "Player":
		_isPlayerInRange = false
