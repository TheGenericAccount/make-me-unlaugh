class_name TimeCounter extends TextureRect

static func formatted_time()->String:
	var timer_int:int=floor(timer);
	return "%02d:%02d"%[timer_int/60, timer_int%60];

static var timer:float=0;
func _ready():
	timer=0;
func _process(delta):
	timer+=delta;
	$Label.text=formatted_time()
