extends Area2D

func compare_closer(a:PhysicsBody2D, b:PhysicsBody2D):
	var a_dist=global_position.distance_to(a.global_position)
	var b_dist=global_position.distance_to(b.global_position)
	return a_dist<b_dist

func _process(delta):
	global_position=get_global_mouse_position()
	if Input.is_action_just_pressed("MOUSE_BUTTON_LEFT"):
		if DragComponent.currently_dragged != null:
			return
		var colliders=get_overlapping_bodies()
		colliders.sort_custom(compare_closer)
		for collider in colliders:
			var drag_component:DragComponent=collider.get_node("DragComponent")
			if drag_component:
				DragComponent.mouse_drag_offset=collider.global_position-global_position
				drag_component.pick_up()
				break
	if Input.is_action_just_released("MOUSE_BUTTON_LEFT"):
		DragComponent.release()
	
