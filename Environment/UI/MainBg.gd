extends TextureRect
class_name PriceManager
const MAX_SUPPLY = 50
const VALUE_PER_DEMAND = 0.5
static func sell(type:String):
	ScoreCounter.laugh-=(MAX_SUPPLY-supply[type])*VALUE_PER_DEMAND
	supply[type]+=1

static var supply={
	"toilet-paper":25,
	"pencil-pack":25,
	"dog-item":10,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
