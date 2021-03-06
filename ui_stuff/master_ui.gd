extends CanvasLayer

onready var button_l = $HBoxContainer/ui_frame_L/VBoxContainer/HBoxContainer/button
onready var button_r = $HBoxContainer/ui_frame_L/VBoxContainer/HBoxContainer/button2
onready var button_d = $HBoxContainer/ui_frame_L/VBoxContainer/button

onready var top_panel=$HBoxContainer/ui_frame_L/VBoxContainer/ui_frame
onready var panel1 =$HBoxContainer/ui_frame_L/VBoxContainer/HBoxContainer/ui_frame
onready var panel2 =$HBoxContainer/ui_frame_L/VBoxContainer/HBoxContainer/ui_frame2
onready var panel3 =$HBoxContainer/ui_frame_L/VBoxContainer/HBoxContainer/ui_frame3

onready var product1=$HBoxContainer/ui_frame_L/VBoxContainer/HBoxContainer2/Panel/CenterContainer/TextureRect
onready var product2=$HBoxContainer/ui_frame_L/VBoxContainer/HBoxContainer2/Panel2/CenterContainer/TextureRect

onready var ring_ring=preload("res://ui_stuff/ring_ring.png")
onready var noise=preload("res://ui_stuff/static.png")

var customer_index:int=0

func _ready():
	button_l.connect("button_down",self,"on_button_left")
	button_r.connect("button_down",self,"on_button_right")
	button_d.connect("button_down",self,"on_button_down")
	Whiteboard.connect("customer_added",self,"_on_customer_added")
	$test_button.connect("button_down",self,"on_test_button_pressed")
	Whiteboard.connect("item_dropped",self,"on_item_dropped")

func on_button_left():
	customer_index=(customer_index-1) % Whiteboard.customers.size()
	print("index:"+str(customer_index))
	populate_panels()
	$AudioUI.playPhoneButtonClick()

func on_button_right():
	customer_index= (customer_index+1) % Whiteboard.customers.size()
	print("index:"+str(customer_index))
	populate_panels()
	$AudioUI.playPhoneButtonClick()

func on_button_down():
	pickup()

func pickup():
	customer_index=Whiteboard.customers.size()-1
	populate_panels()

func _on_customer_added():
	top_panel.texture=ring_ring
	panel1.texture=noise
	panel2.texture=noise
	panel3.texture=noise
	$AudioUI.playPhoneRing()

func on_item_dropped(item):
	Whiteboard.customers[customer_index].evaluate_product(item)
	# TODO: yeah, probably?
	populate_panels()
	pass

func populate_panels():
	top_panel.texture=Whiteboard.customers[customer_index].image
	panel2.texture=Whiteboard.customers[customer_index].thumbnail
	panel1.texture=Whiteboard.customers[customer_index-1].thumbnail
	panel3.texture=Whiteboard.customers[(customer_index+1) % Whiteboard.customers.size()].thumbnail
	product1.texture=Whiteboard.customers[customer_index].products[0].image
	product2.texture=Whiteboard.customers[customer_index].products[1].image

func on_test_button_pressed():
	var my_crate=Product.new()
	#add_child(my_crate)
	Whiteboard.emit_signal("item_dropped",my_crate)
