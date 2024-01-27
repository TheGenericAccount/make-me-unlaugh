extends RigidBody2D
class_name Converter

var pickup_points:Array[ConverterPickup]
var spawn_points:Array[ConverterSpawn]

func _ready():
	for child in get_children():
		if(child is ConverterPickup):
			pickup_points.push_back(child)
			pickup_points.back().item_inserted.connect(process_fulfill)
		if child is ConverterSpawn:
			spawn_points.push_back(child)

func process_fulfill():
	if not is_fulfilled():
		return
	for pickup_point in pickup_points:
		pickup_point.fulfilled=false
	
	reward()


func reward():
	pass

func is_fulfilled()->bool:
	for pickup_point in pickup_points:
		if not pickup_point.fulfilled:
			return false
	return true
