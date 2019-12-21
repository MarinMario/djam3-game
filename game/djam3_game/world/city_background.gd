extends Node2D

var speed := 100
var despawn_timer := 0.0

func _process(delta):
	self.position.x -= speed * delta
	
	despawn_timer += delta
	if despawn_timer > 35:
		self.queue_free()
