extends RigidBody2D

@export var STATIC_FORCE:Vector2

func _ready():
	body_entered.connect(_body_entered)
	body_exited.connect(_body_exited)

func _body_entered(body:Node):
	if(!body is RigidBody2D):
		return
	body.add_constant_central_force(STATIC_FORCE)

func _body_exited(body:Node):
	if(!body is RigidBody2D):
		return
	body.add_constant_central_force(-STATIC_FORCE)
