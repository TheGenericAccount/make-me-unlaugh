extends Control

@export var panel:NodePath
var panel_instance

func _ready():
	panel_instance=get_node(panel)
	panel_instance.visible=false
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	print("entered")
	panel_instance.visible=true


func _on_mouse_exited():
	panel_instance.visible=false
