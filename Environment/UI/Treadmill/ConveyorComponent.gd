extends Node2D

@export var item_to_spawn:PackedScene
@export var angle_randomness:float=0

func _ready():
	get_parent().gravity_scale=.2



func _process(delta):
	if get_parent().global_position.x<1000:
		ItemParent.number_of_tools+=1
		get_parent().gravity_scale=1
		var instance=item_to_spawn.instantiate()
		instance.global_position=get_global_mouse_position()
		ItemParent.instance.add_child(instance)
		instance.rotation=randf_range(-angle_randomness, angle_randomness)
		instance.get_node("DragComponent").pick_up()
		get_parent().queue_free()
	if get_parent().global_position.y>1500:
		get_parent().queue_free()
