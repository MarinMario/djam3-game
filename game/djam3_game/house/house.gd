extends StaticBody2D


func _ready():
	randomize()
	get_parent().position.x = 1800
	get_parent().global_position.y = rand_range(300, 600)
	$Sprite.modulate = Color(rand_range(0.1,0.2), rand_range(0.1,0.2), rand_range(0.2,0.3))
	
func _physics_process(delta):
	get_parent().global_position.x -= global.building_speed * delta
	
	if get_parent().position.x <= -800:
		self.queue_free()