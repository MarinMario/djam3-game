extends Node2D

var anim_timer := 0.0

func _ready():
	randomize()
	self.modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))

func _process(delta):
	anim_timer += delta
	
	if anim_timer >= 5:
		$anims.play("done")
	else:
		$anims.play("scale")


func _on_anims_animation_finished(anim_name):
	if anim_name == "done":
		self.queue_free()
