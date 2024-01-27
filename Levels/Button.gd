extends Button
var was_pressed = false


var game = preload("res://Levels/game.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	if !was_pressed:
		$"../BlackScreen/AnimationPlayer".play("UnFade")
		was_pressed = true
		


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "UnFade":
		get_tree().change_scene_to_packed(game)
