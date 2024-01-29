extends Control
@export var type:String
const LOW_SUPPLY_THRESHOLD=0.3
const HIGH_SUPPLY_THRESHOLD=0.6
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(PriceManager.supply[type]<PriceManager.MAX_SUPPLY*LOW_SUPPLY_THRESHOLD):
		$PriceTexture.texture=preload("res://Environment/UI/ProgressTextures/High.png")
	elif(PriceManager.supply[type]>PriceManager.MAX_SUPPLY*HIGH_SUPPLY_THRESHOLD):
		$PriceTexture.texture=preload("res://Environment/UI/ProgressTextures/Low.png")
	else:
		$PriceTexture.texture=preload("res://Environment/UI/ProgressTextures/Medium.png")
