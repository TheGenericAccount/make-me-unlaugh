class_name ScoreCounter
extends TextureProgressBar

const MULTIPLIER_BASE = 1
static var timer:float = 1.00:
	set(value):
		return clamp(value, 0 ,100)
static var multiplier:float = MULTIPLIER_BASE
# Called when the node enters the scene tree for the first time.
func _ready():
	value=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer+=delta*multiplier
	value=timer
	if timer < 20:
		multiplier *= 1.01

