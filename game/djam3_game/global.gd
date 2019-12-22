extends Node2D

const SMALL_HOUSE = preload("res://house/small_house.tscn")
const MEDIUM_HOUSE = preload("res://house/medium_house.tscn")
const BIG_HOUSE = preload("res://house/big_house.tscn")
const WINDOW = preload("res://house/window.tscn")
const GIFT = preload("res://gift/gift.tscn")
const CITY_BG = preload("res://world/city_background.tscn")
const PLUS_MINUS = preload("res://world/plusminus.tscn")

var score := 0
var best_score := 0
var building_speed := 500
var sound_volume = 70

func _on_music_finished():
	$music.play()
