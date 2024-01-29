extends Button
var was_pressed = false

@export_file("*.tscn") var game:String 

func _ready():
	pressed.connect(_on_pressed)

func _process(delta):
	pass

func _on_pressed():
	if !was_pressed:
		Transition.change_scene(load(game).instantiate())
		was_pressed = true


