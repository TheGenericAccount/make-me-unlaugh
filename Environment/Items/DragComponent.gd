extends Node2D


static var currently_dragged:RigidBody2D=null;
static var MOUSE_DRAG_MULTIPLIER:float=1000;
static var MOUSE_DRAG_MAX_FORCE:float=30000;
static var MOUSE_DRAG_MAX_SPEED:float=2000;
static var MOUSE_DRAG_DISTANCE_ALLOWED:float=2000;
static var MOUSE_DAMP_THRESHOLD:float=200
static var MOUSE_DEFAULT_DAMP:float=0
static var MOUSE_CLOSE_DAMP:float=30
@onready var parent:RigidBody2D=get_parent();

func _ready():
	parent.input_event.connect(_on_parent_input_event);
	parent.input_pickable=true;

func _process(delta):
	if(Input.is_action_just_released("MOUSE_BUTTON_LEFT")):
		currently_dragged=null;

func _physics_process(delta:float):
	if currently_dragged==parent:
		parent.modulate=Color.RED;
		parent.gravity_scale=0;
		var force_vector:Vector2=(get_global_mouse_position()-parent.global_position)
		var throw_multiplier=min(force_vector.length()*MOUSE_DRAG_MULTIPLIER, MOUSE_DRAG_MAX_FORCE)
		if parent.linear_velocity.length()>MOUSE_DRAG_MAX_SPEED:
			throw_multiplier=0
		if (parent.global_position.distance_to(get_global_mouse_position())<MOUSE_DAMP_THRESHOLD):
			parent.linear_damp=MOUSE_CLOSE_DAMP
		else:
			parent.linear_damp=MOUSE_DEFAULT_DAMP
		
		force_vector=force_vector.normalized()*throw_multiplier
		parent.apply_central_force(force_vector)
	else:
		parent.gravity_scale=1;
		parent.linear_damp=MOUSE_DEFAULT_DAMP
		parent.modulate=Color.WHITE;

func _on_parent_input_event(viewport:Node, event:InputEvent, shape_idx:int)->void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if(currently_dragged!=null):
				return;
			currently_dragged=parent;


