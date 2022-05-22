extends Resource
class_name Customer

export(Texture) var image
export(Texture) var thumbnail
export(Array) var products

func _init():
	generate_person()
	generate_products()
	Whiteboard.connect("item_dropped",self,"evaluate_product")

func generate_person():
	if !image:
		var index=randi() % IMAGES.size()
		image = IMAGES[index]
		thumbnail = THUMBS[index]

func generate_products():
	for i in 2:
		products.append(Product.new())

func evaluate_product(product:Node):
	for want in products:
		if want.name == product.name:
			product.destroy()
			return

# Careful: make sure to keep these ordered right
const IMAGES:Array=[
	preload("res://customers/image_example.png"),
	preload("res://customers/image_2.png"),
]
const THUMBS:Array=[
	preload("res://customers/thumb_example.png"),
	preload("res://customers/thumb_2.png")
]
