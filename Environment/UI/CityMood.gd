extends TextureRect

const NEUTRAL_START = 30
const NEUTRAL_END = 70

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ScoreCounter.laugh < NEUTRAL_START:
		$AnimationPlayer.play("Sad")
	elif ScoreCounter.laugh > NEUTRAL_END:
		$AnimationPlayer.play("Happy")
	else: $AnimationPlayer.play("Neutral")
