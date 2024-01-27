extends Node2D
class_name RewardComponent
@export var reward:float

func assign_reward():
	ScoreCounter.laugh-=reward
