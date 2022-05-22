extends Node2D

export (int) var carriedItemOffset = 50	
export (int) var maxItemCapacity = 5
export (float) var inventoryFullFlashAnimationTime = 0.2

func _onItemPickedUp(item : PackedScene):
	if get_child_count() < maxItemCapacity + 1: # +1 because there is always a child with a tween object
		var instancedItem : Node2D = item.instance()

		add_child(instancedItem)
		instancedItem.position.y = instancedItem.position.y - carriedItemOffset * (get_child_count() - 2) # -2 again because of the tween object
	else:
		for i in range(get_child_count()):
			var currentChild = get_child(i)
			if currentChild.is_in_group("Pickup"):
				var sprite : Sprite = currentChild.get_node("Sprite");
				
				$Tween.interpolate_property(
					sprite, 
					"modulate",
					Color(1, 0, 0), 
					Color(1, 1, 1), 
					inventoryFullFlashAnimationTime,
					Tween.TRANS_LINEAR, 
					Tween.EASE_IN_OUT
				)

				$Tween.start()
