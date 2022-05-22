extends Resource
class_name Customer

export(Texture) var image
export(Texture) var thumbnail
export(Array) var products


func _init():
	generate_person()
	generate_products()

func generate_person():
	if !image:
		var index=randi() % IMAGES.size()
		image = IMAGES[index]
		thumbnail = THUMBS[index]

func generate_products():
	pass

# Careful: make sure to keep these ordere right
const IMAGES:Array=[
	preload("res://customers/image_example.png"),
	preload("res://customers/image_2.png"),
]
const THUMBS:Array=[
	preload("res://customers/thumb_example.png"),
	preload("res://customers/thumb_2.png")
]

const PRODUCTS:Array=[]
