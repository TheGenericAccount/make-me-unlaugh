extends Sprite2D

@export var options:Array[Texture]

func _ready():
	if options.size()<=0:
		return
	texture=options.pick_random()
