class_name ConverterSpawn extends Node2D

@export var resource_to_spawn:PackedScene
@export var probability:float=1
@export var x_spread:float=20

func spawn()->void:
	var instance:Node2D=resource_to_spawn.instantiate()
	add_child(instance)
	instance.global_position.x+=randf_range(-x_spread, x_spread)
	instance.global_rotation+=randf_range(0, 360)
