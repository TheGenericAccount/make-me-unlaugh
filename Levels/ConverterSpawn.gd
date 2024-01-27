class_name ConverterSpawn extends Node2D

@export var resource_to_spawn:PackedScene
@export var probability:float=1
@export var x_spread:float=20

func spawn()->void:
	var item_parent=ItemParent.instance
	var instance=resource_to_spawn.instantiate()
	instance.global_position=global_position
	item_parent.add_child(instance)
	instance.global_rotation+=randf_range(0, 360)
