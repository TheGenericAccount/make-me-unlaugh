extends TextureRect

const NEUTRAL_START = 40
const NEUTRAL_END = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ScoreCounter.bar_percentage < NEUTRAL_START:
		$AnimationPlayer.play("Sad")
	elif ScoreCounter.bar_percentage > NEUTRAL_END:
		$AnimationPlayer.play("Happy")
	else: $AnimationPlayer.play("Neutral")


func _on_laugh_timer_timeout():
	if ScoreCounter.laugh>NEUTRAL_END:
		if randi()%2==0:
			$Sound1.play()
		else:
			$Sound2.play()
