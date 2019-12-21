extends Sprite

func _ready():
	randomize()
	var colors = [Color(100,100,100), "#545230"]
	self.modulate = colors[randi()%colors.size() - 1]
	
	if self.modulate == Color(100,100,100):
		self.queue_free()
