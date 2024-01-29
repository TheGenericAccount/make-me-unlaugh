extends Area2D

func compare_closer(a:PhysicsBody2D, b:PhysicsBody2D):
	var a_dist=global_position.distance_to(a.global_position)
	var b_dist=global_position.distance_to(b.global_position)
	return a_dist<b_dist

func filter_colliders(collider):
	if collider!=DragComponent.currently_dragged:
			if collider.get_node_or_null("DragComponent")!=null:
				return true
	return false

func _process(delta):
	global_position=get_global_mouse_position()
	var colliders=get_overlapping_bodies()
	colliders.filter(filter_colliders)

	
	colliders.sort_custom(compare_closer)
	
	if Input.is_action_just_pressed("MOUSE_BUTTON_LEFT"):
		if DragComponent.currently_dragged != null:
			return

		for collider in colliders:
				DragComponent.mouse_drag_offset=collider.global_position-global_position
				var drag=collider.get_node("DragComponent")
				if drag:
					collider.get_node("DragComponent").pick_up()
					break
	if Input.is_action_just_released("MOUSE_BUTTON_LEFT"):
		DragComponent.release()
	
