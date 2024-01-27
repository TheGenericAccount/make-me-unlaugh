extends Button
var was_pressed = false

var game = preload("res://Levels/game.tscn")

func _process(delta):
	pass

func _on_pressed():
	if !was_pressed:
		Transition.change_scene(game)
		was_pressed = true

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "UnFade":
		get_tree().change_scene_to_packed(game)
