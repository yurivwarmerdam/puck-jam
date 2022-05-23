extends Node2D

export (int) var carriedItemOffset = 50	
export (int) var maxItemCapacity = 5
export (float) var inventoryFullFlashAnimationTime = 0.2

onready var _carriedItemsNode : Node2D = $CarriedItems

func _onItemPickedUp(item : PackedScene):
	var numberOfPickedUpItems = _carriedItemsNode.get_child_count()
	
	if numberOfPickedUpItems < maxItemCapacity:
		var instancedItem : Node2D = item.instance()
		instancedItem.position.y = instancedItem.position.y - carriedItemOffset * numberOfPickedUpItems
		
		_carriedItemsNode.add_child(instancedItem)
	else:
		flashItemsFull(inventoryFullFlashAnimationTime)

func _physics_process (delta):
	var pickedUpItems = _carriedItemsNode.get_children()
	
	if Input.is_action_just_pressed("drop") && !pickedUpItems.empty():
		var lastPickedUpItem : Node2D = pickedUpItems.pop_back()
		var globalPosition = lastPickedUpItem.global_position
		_carriedItemsNode.remove_child(lastPickedUpItem)
		
		var worldItems = get_tree().get_nodes_in_group("WorldItems")
		worldItems[0].add_child(lastPickedUpItem)
		lastPickedUpItem.global_position = globalPosition
		lastPickedUpItem.isActive = true

func flashItemsFull(animationTime):
	for i in range(_carriedItemsNode.get_child_count()):
		var currentChild = _carriedItemsNode.get_child(i)
		var sprite : Sprite = currentChild.get_node("Sprite");
		
		$Tween.interpolate_property(
			sprite, 
			"modulate",
			Color(1, 0, 0), 
			Color(1, 1, 1), 
			animationTime,
			Tween.TRANS_LINEAR, 
			Tween.EASE_IN_OUT
		)

		$Tween.start()
