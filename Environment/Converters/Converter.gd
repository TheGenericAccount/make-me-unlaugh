extends RigidBody2D
class_name Converter

var pickup_points:Array[ConverterPickup]
var spawn_points:Array[ConverterSpawn]
const CONVERTION_DELAY=0.1

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
	
	await get_tree().create_timer(CONVERTION_DELAY).timeout 
	for pickup_point in pickup_points:
		for body in pickup_point.get_overlapping_bodies():
			pickup_point._body_entered(body)


func reward():
	for spawn_point in spawn_points:
		spawn_point.call_deferred("spawn")
	#for spawn_point in spawn_points

func is_fulfilled()->bool:
	for pickup_point in pickup_points:
		if not pickup_point.fulfilled:
			return false
	return true

