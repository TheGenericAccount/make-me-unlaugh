extends Node2D

@export var RESOURCE_TO_SPAWN:PackedScene
@export var SPAWN_INSTANTLY:bool=false
@export var SPAWN_INTERVAL:float=5
@export var MAX_TO_SPAWN:int=999
@export var X_SPREAD:float=100
const SPAWN_THROTTLE_BASE=2
const SPAWN_THROTTLE_BEGIN=10
var items_spawned=0

func _ready():
	$Timer.wait_time=max(1, SPAWN_INTERVAL+randf_range(-1, 1))
	$Timer.start()
	return
	if(SPAWN_INSTANTLY):
		spawn()

func _on_timer_timeout():
	spawn()
	var total_items=max(0, ItemParent.number_of_items-SPAWN_THROTTLE_BEGIN)
	$Timer.wait_time=SPAWN_INTERVAL*pow(SPAWN_THROTTLE_BASE, total_items)

func spawn()->void:
	if(items_spawned>MAX_TO_SPAWN):
		return
	var item_parent=ItemParent.instance
	var instance:Node2D=RESOURCE_TO_SPAWN.instantiate()
	instance.global_position=global_position
	instance.global_position.x+=randf_range(-X_SPREAD, X_SPREAD)
	instance.global_rotation+=randf_range(0, 360)
	item_parent.add_child(instance)
	instance.tree_exiting.connect(on_offsprint_destroyed)
	items_spawned+=1;
	ItemParent.number_of_items+=1

func on_offsprint_destroyed():
	items_spawned-=1
	ItemParent.number_of_items-=1
