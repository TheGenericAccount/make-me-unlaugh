extends Node2D

@export var item_to_spawn:PackedScene
@export var angle_randomness:float=0

func _ready():
	get_parent().gravity_scale=.2



func _process(delta):
	if get_parent().global_position.x<1300:
		ItemParent.number_of_tools+=1
		get_parent().gravity_scale=1
		var instance=item_to_spawn.instantiate()
		instance.global_position=get_global_mouse_position()
		ItemParent.instance.add_child(instance)
		instance.rotation_degrees=randf_range(-angle_randomness, angle_randomness)
		instance.get_node("DragComponent").pick_up()
		get_parent().queue_free()
	if get_parent().global_position.y>1300 or get_parent().global_position.x>1450:
		get_parent().queue_free()
