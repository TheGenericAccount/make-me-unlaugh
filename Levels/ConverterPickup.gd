extends Area2D

class_name ConverterPickup

@export var needs_to_fulfill:int=1
var inserted_items:int=0
var fulfilled:bool:
	get:
		return inserted_items>=needs_to_fulfill
	set:
		inserted_items=0
signal item_inserted(fulfilled:bool)

func _ready():
	body_entered.connect(_body_entered)

func _body_entered(body:Node2D):
	if (not body.get_node_or_null("RewardComponent")or
			inserted_items>=needs_to_fulfill):
		return
	body.queue_free()
	inserted_items+=1;
	item_inserted.emit(fulfilled)
