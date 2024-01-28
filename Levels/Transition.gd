extends ColorRect
var current_scene
var changing_scene
func change_scene(scene):
	$AnimationPlayer.play("UnFade")
	changing_scene=scene

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "UnFade":
		current_scene.queue_free()
		var instance = changing_scene
		get_tree().get_root().add_child(instance)
		current_scene = instance
		get_parent().move_child.call_deferred(instance,0)
		get_parent().move_child.call_deferred(self,1)
		$AnimationPlayer.play("Fade")

func _ready():
	get_parent().move_child.call_deferred(self,1)




