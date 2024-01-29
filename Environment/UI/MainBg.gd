extends TextureRect
class_name PriceManager
const MAX_SUPPLY = 30
const VALUE_PER_DEMAND = 2
const MIN_PRICE=5
static func sell(type:String):
	ScoreCounter.laugh-=max((MAX_SUPPLY-supply[type])*VALUE_PER_DEMAND,MIN_PRICE)
	supply[type]+=1

static var supply={
	"toilet-paper":25,
	"pencil-pack":25,
	"dog-item":10,
	"tear-item":20,
	"steam-item":0,
	"trash-item":15,
}

static var price_increase_probability={
	"toilet-paper":0.5,
	"pencil-pack":0.5,
	"dog-item":1,
	"tear-item":1,
	"steam-item":1,
	"trash-item":0.7
}

func _on_supply_timer_timeout():
	for item in supply:
		if randf()<price_increase_probability[item]:
			supply[item]+=randi_range(-3,1)
			supply[item]=min(0, supply[item])

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Supply.text=""
	for item in supply:
		$Supply.text+=str(supply[item])
		$Supply.text+="\n"
