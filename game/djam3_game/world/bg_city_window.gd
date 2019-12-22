extends Sprite

func _ready():
	randomize()
	if randi()%2 == 0:
		self.modulate = "#545230"
	else:
		self.queue_free()
	
	if self.modulate == Color(100,100,100):
		self.queue_free()
