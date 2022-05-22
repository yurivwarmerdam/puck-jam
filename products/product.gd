extends Resource
class_name Product

export(String) var name
export(Texture) var image

func _init():
	var my_item=PRODUCTS.keys()[randi() % PRODUCTS.size()]
	name=my_item
	image=PRODUCTS[my_item]


const PRODUCTS:Dictionary={
	melon=preload("res://products/product_1.png"),
	tram=preload("res://products/product_2.png"),
}
