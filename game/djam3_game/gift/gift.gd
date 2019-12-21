extends Node2D

var target: Vector2
var speed = 1000

func _ready():
	self.position.y = -200
	self.position.x = target.x

func _process(delta):
	self.position.y += speed * delta
	self.position.x -= 500 * delta
	
	if self.position.y > 800:
		global.score -= 1
		print(global.score)
		self.queue_free()

func _on_gift_area_entered(area):
	if area.is_in_group("horn"):
		global.score += 1
		print(global.score)
		self.queue_free()
