extends TextureRect
class_name PriceManager
static var MAX_SUPPLY = 20
const VALUE_PER_DEMAND = 2
const MIN_PRICE=5
static func sell(type:String):
	ScoreCounter.laugh-=max((MAX_SUPPLY-supply[type])*VALUE_PER_DEMAND,MIN_PRICE)
	supply[type]+=1

static var supply={
	"toilet-paper":15,
	"pencil-pack":15,
	"dog-item":0,
	"tear-item":10,
	"steam-item":0,
	"trash-item":10,
}

static var price_increase_probability={
	"toilet-paper":0.1,
	"pencil-pack":0.1,
	"dog-item":.25,
	"tear-item":.25,
	"steam-item":.25,
	"trash-item":0.15
}

func _on_supply_timer_timeout():
	for item in supply:
		if randf()<price_increase_probability[item]:
			supply[item]+=randi_range(-3,1)
			supply[item]=max(0, supply[item])

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Supply.text=""
	for item in supply:
		$Supply.text+=str(supply[item])
		$Supply.text+="\n"
