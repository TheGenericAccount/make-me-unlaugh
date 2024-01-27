extends Area2D

class_name ConverterPickup

@export var needs_to_fulfill:int=1
@export var accepted_items:Array[Script]
var inserted_items:int=0
var fulfilled:bool:
	get:
		return inserted_items>=needs_to_fulfill
	set(value):
		inserted_items=value as int * needs_to_fulfill
		#if value == false:
		#	for body in get_overlapping_bodies():
		#		_body_entered.call_deferred(body)

signal item_inserted()

func _ready():
	body_entered.connect(_body_entered)

func _body_entered(body:Node2D):
	if (not body.get_node_or_null("RewardComponent")or
			inserted_items>=needs_to_fulfill):
		return
	var accepted:=false

	for accepted_item in accepted_items:
		if is_instance_of(body, accepted_item):
			accepted=true
	if not accepted:
		return
	body.queue_free()
	inserted_items+=1;
	print("fulfilled ",body.name)
	call_deferred("emit_signal", "item_inserted")
