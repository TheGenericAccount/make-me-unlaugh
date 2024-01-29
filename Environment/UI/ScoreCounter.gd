class_name ScoreCounter
extends TextureProgressBar

const BASE_MULTIPLIER = 1
const MAX_MULTIPLIER = 10
const MULTIPLIER_EXP = 1.1
const MULTIPLIER_TIME = 5

static var laugh:float = 1.00:
	set(val):
		laugh=clamp(val, 0.0 ,100.0)
static var multiplier:float = BASE_MULTIPLIER

func _ready():
	value=0
	$Timer.wait_time = MULTIPLIER_TIME
	$Timer.start()

func _process(delta):
	laugh+=delta*multiplier
	value=laugh

func _on_timer_timeout():
	if multiplier < MAX_MULTIPLIER:
		multiplier *= MULTIPLIER_EXP
