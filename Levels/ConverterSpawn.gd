class_name ConverterSpawn extends Node2D

@export var resource_to_spawn:PackedScene
@export var probability:float=1
@export var x_spread:float=20
@export var rotation_spread:float=360
@export var initial_velocity:Vector2=Vector2(0,0)
@export var max_velocity_randomness:float=1.5

func spawn(use_item_parent=true)->void:
	if(randf()>probability):
		return
	var item_parent=ItemParent.instance if use_item_parent else get_parent()
	var instance:RigidBody2D=resource_to_spawn.instantiate()
	item_parent.add_child(instance)
	instance.global_position=global_position
	instance.linear_velocity=initial_velocity*randf_range(1, max_velocity_randomness)
	instance.global_rotation+=randf_range(0, rotation_spread)
