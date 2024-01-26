extends Node2D

@export var RESOURCE_TO_SPAWN:PackedScene
@export var SPAWN_INSTANTLY:bool=false
@export var SPAWN_INTERVAL:float=5
@export var MAX_TO_SPAWN:int=5
@export var X_SPREAD:float=100

func _ready():
	$Timer.wait_time=SPAWN_INTERVAL
	$Timer.start()
	if(SPAWN_INSTANTLY):
		spawn()

func _on_timer_timeout():
	spawn()

func spawn()->void:
	if(get_child_count()>MAX_TO_SPAWN):
		return
	var instance:Node2D=RESOURCE_TO_SPAWN.instantiate()
	add_child(instance)
	instance.global_position.x+=randf_range(-X_SPREAD, X_SPREAD)
	instance.global_rotation+=randf_range(0, 360)
	
