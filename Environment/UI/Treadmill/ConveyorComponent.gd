extends Node2D

@export var item_to_spawn:PackedScene


func _ready():
	get_parent().gravity_scale=.2



func _update():
	if get_parent().global_position.x<1200:
		get_parent().gravity_scale=1
		queue_free()
