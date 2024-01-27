extends TextureRect
class_name PriceManager
const MAX_SUPPLY = 30
const VALUE_PER_DEMAND = 2
static func sell(type:String):
	ScoreCounter.laugh-=(MAX_SUPPLY-supply[type])*VALUE_PER_DEMAND
	supply[type]+=1

static var supply={
	"toilet-paper":25,
	"pencil-pack":25,
	"dog-item":10,
	"tear-item":20,
	"steam-item":0,
}

func _on_supply_timer_timeout():
	for item in supply:
		if supply[item] >= 3:
			supply[item]+=randi_range(-3,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Supply.text=""
	for item in supply:
		$Supply.text+=str(supply[item])
		$Supply.text+="\n"
