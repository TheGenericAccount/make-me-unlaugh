class_name ScoreCounter
extends TextureProgressBar

const BASE_LAUGH_INCREASE_SPEED = 1
const MAX_LAUGH_INCREASE_SPEED = 10
const LAUGH_INCREASE_SPEED_EXP = 1.1
const LAUGH_SPEED_INCREASE_INTERVAL = 5
const INITIAL_LAUGH=30

static var laugh:float = INITIAL_LAUGH:
	set(val):
		laugh=clamp(val, 0.0 ,100.0)
static var laugh_per_second:float = BASE_LAUGH_INCREASE_SPEED:
	set(val):
		laugh_per_second=clamp(val, 0.0, MAX_LAUGH_INCREASE_SPEED)

func _ready():
	value=INITIAL_LAUGH
	$Timer.wait_time = LAUGH_SPEED_INCREASE_INTERVAL
	$Timer.start()

func _process(delta):
	laugh+=delta*laugh_per_second
	value=ease_out_quint(laugh/100)*100

func ease_out_quint(x: float)->float:
	return 1 - pow(1 - x, 5);


func ease_out_sine(x:float)->float:
	return sin((x * PI) / 2);

func increase_laugh_per_second():
	laugh_per_second *= LAUGH_INCREASE_SPEED_EXP
