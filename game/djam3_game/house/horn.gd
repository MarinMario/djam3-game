extends Area2D

func _ready():
	$Sprite.modulate = get_parent().get_node("house").get_node("Sprite").modulate
