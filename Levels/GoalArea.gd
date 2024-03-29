extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body:Node2D):
	var reward_component=body.get_node_or_null('RewardComponent')
	if reward_component==null:
		return
	reward_component.assign_reward();
	$Sound.play()
	body.queue_free();
