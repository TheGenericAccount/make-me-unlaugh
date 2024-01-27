extends Node2D

const WAVE_TIME=5
const DROPPED_BOXES_EXPONENT=1.2
@onready var waves:Array=$Waves.get_children()
var wave_index:=0
var dropped_boxes=0

func _ready():
	update_wait_time()

func _on_timer_timeout():
	dropped_boxes+=1
	wave_index=wrapi(wave_index+1, 0, waves.size())
	waves[wave_index].spawn(false)
	update_wait_time()

func update_wait_time():
	var dropped_boxes_multiplier=pow(DROPPED_BOXES_EXPONENT, dropped_boxes)
	$Timer.wait_time=(WAVE_TIME+randf_range(-1, 1))*dropped_boxes_multiplier
	$Timer.start()
