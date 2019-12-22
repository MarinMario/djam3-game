extends Node2D

var state := "plus"

func _ready():
	position.x = rand_range((1280/2)-100,(1280/2) + 100)
	position.y = rand_range((720/2)-100,(720/2) + 100)
	$states.modulate.a = 0
	$states.scale = Vector2(0,0)
	
	
	$states.play(state)
	$anim.play("ready")
