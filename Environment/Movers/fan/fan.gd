extends RigidBody2D
@export var min_force:float=1000
@export var max_force:float=5000
const Y_MULTIPLIER=2

var max_distance=0

func _ready():
	var points:PackedVector2Array=$"WindArea/CollisionPolygon2D".polygon
	for point in points:
		max_distance=max(max_distance, Vector2.ZERO.distance_to(point))
	

func _physics_process(delta):
	var overlapping=$WindArea.get_overlapping_bodies()
	for body in overlapping:
		if body is RigidBody2D:
			var distance=global_position.distance_to(body.global_position)
			var force:Vector2=(body.global_position-global_position)
			force.y*=Y_MULTIPLIER
			force=force.normalized()
			force*=lerp(max_force, min_force, distance/max_distance)
			body.apply_central_force(force)
