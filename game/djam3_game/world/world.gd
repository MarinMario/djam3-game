extends Node2D

func spawn_house():
	var house = global.HOUSE.instance()
	add_child(house)
