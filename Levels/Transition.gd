extends ColorRect
var current_scene
var changing_scene
func change_scene(scene):
	print("change ", scene)
	$AnimationPlayer.play("UnFade")
	changing_scene=scene

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "UnFade":
		current_scene.queue_free()
		get_tree().get_root().add_child(changing_scene)
		current_scene=changing_scene
		get_parent().move_child.call_deferred(changing_scene,0)
		get_parent().move_child.call_deferred(self,1)
		$AnimationPlayer.play("Fade")

func _ready():
	get_parent().move_child.call_deferred(self,1)




