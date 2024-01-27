extends Node2D

func _ready():
	get_parent().linear_damp=100
	print(get_parent().linear_damp)
