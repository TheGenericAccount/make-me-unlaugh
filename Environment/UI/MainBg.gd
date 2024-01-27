extends TextureRect
class_name PriceManager
static func sell(type:String):
	supply[type]+=1
	print(supply[type])
	

static var supply={
	"toilet-paper":10,
	"pencil-pack":10,
	"dog-item":30,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
