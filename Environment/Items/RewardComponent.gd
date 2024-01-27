extends Node2D
class_name RewardComponent
@export var type:String

func assign_reward():
	PriceManager.sell(type)
