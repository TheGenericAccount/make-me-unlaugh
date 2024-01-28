extends Control
@export var type:String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(PriceManager.supply[type]<10):
		$PriceTexture.texture=preload("res://Environment/UI/ProgressTextures/High.png")
	elif(PriceManager.supply[type]>20):
		$PriceTexture.texture=preload("res://Environment/UI/ProgressTextures/Low.png")
	else:
		$PriceTexture.texture=preload("res://Environment/UI/ProgressTextures/Medium.png")
