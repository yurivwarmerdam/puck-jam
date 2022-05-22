extends Node

var customers:Array=[]

signal customer_added
signal item_dropped(item)

onready var customer_timer:Timer

func _ready():
	randomize()
	customer_timer=Timer.new()
	add_child(customer_timer)
	customer_timer.wait_time=2
	customer_timer.connect("timeout",self,"on_timer_timeout")
	customer_timer.start()

func add_customer():
	if customers.size() <3:
		var new_customer=Customer.new()
		customers.append(new_customer)
		emit_signal("customer_added")

func on_timer_timeout():
	add_customer()
	# TODO: Wheee! Inifinte loop!
	customer_timer.start()
