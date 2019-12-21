extends Node2D

func _ready():
	randomize()
	var anim = str(randi()%2+1)
	$sprite.play(anim)
