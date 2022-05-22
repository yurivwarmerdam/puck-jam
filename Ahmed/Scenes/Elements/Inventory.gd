extends Node2D

export (int) var carriedItemOffset = 50	

func _onItemPickedUp(item : PackedScene):
	var instancedItem : Node2D = item.instance()

	add_child(instancedItem)
	instancedItem.position.y = instancedItem.position.y - carriedItemOffset * (get_child_count() - 1)
	
	print(instancedItem.position)
