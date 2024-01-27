extends Node2D


static var currently_dragged:RigidBody2D=null;
var MOUSE_DRAG_MULTIPLIER:float=1000;
var MOUSE_DRAG_MAX_FORCE:float=30000;
var MOUSE_DRAG_MAX_SPEED:float=2000*10000;
const MOUSE_DRAG_DISTANCE_ALLOWED:float=2000;
const MOUSE_DAMP_THRESHOLD:float=200

@export var MOUSE_CLOSE_DAMP:float=30
@export var CONSTANTS_MULTIPLIER:float=1
@onready var parent:RigidBody2D=get_parent();
@onready var MOUSE_DEFAULT_DAMP:float=parent.linear_damp
@onready var UNFREEZE_WHILE_DRAGGING:bool=parent.freeze
var initial_gravity_scale

func _ready():
	parent.input_event.connect(_on_parent_input_event);
	parent.input_pickable=true;
	MOUSE_DRAG_MULTIPLIER*=parent.mass*CONSTANTS_MULTIPLIER
	MOUSE_DRAG_MAX_FORCE*=parent.mass*CONSTANTS_MULTIPLIER
	MOUSE_DRAG_MAX_SPEED*=CONSTANTS_MULTIPLIER

func _process(delta):
	if(Input.is_action_just_released("MOUSE_BUTTON_LEFT")):
		if(currently_dragged==parent):
			currently_dragged=null;
			if UNFREEZE_WHILE_DRAGGING:
				parent.freeze=true
			parent.gravity_scale=1;
			parent.linear_damp=MOUSE_DEFAULT_DAMP

func _physics_process(delta:float):
	if currently_dragged==parent:
		var force_vector:Vector2=(get_global_mouse_position()-parent.global_position)
		var throw_multiplier=min(force_vector.length()*MOUSE_DRAG_MULTIPLIER, MOUSE_DRAG_MAX_FORCE)
		var estimated_velocity:Vector2=(parent.linear_velocity.normalized()+force_vector.normalized()).normalized()*parent.linear_velocity.length()
		if estimated_velocity.length()>MOUSE_DRAG_MAX_SPEED:
			throw_multiplier=0
		if (parent.global_position.distance_to(get_global_mouse_position())<MOUSE_DAMP_THRESHOLD):
			parent.linear_damp=MOUSE_CLOSE_DAMP
		else:
			parent.linear_damp=MOUSE_DEFAULT_DAMP
		
		force_vector=force_vector.normalized()*throw_multiplier
		parent.apply_central_force(force_vector)


func _on_parent_input_event(viewport:Node, event:InputEvent, shape_idx:int)->void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if(currently_dragged!=null):
				return;
			currently_dragged=parent;
			if UNFREEZE_WHILE_DRAGGING:
				parent.freeze=false
			initial_gravity_scale=parent.gravity_scale
			parent.gravity_scale=0;


