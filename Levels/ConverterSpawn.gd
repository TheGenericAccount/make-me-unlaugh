class_name ConverterSpawn extends Node2D

@export var resource_to_spawn:PackedScene
@export var probability:float=1
@export var x_spread:float=20
@export var rotation_spread:float=360

func spawn(use_item_parent=true)->void:
	var item_parent=ItemParent.instance if use_item_parent else get_parent()
	var instance=resource_to_spawn.instantiate()
	item_parent.add_child(instance)
	instance.global_position=global_position
	instance.global_rotation+=randf_range(0, rotation_spread)
