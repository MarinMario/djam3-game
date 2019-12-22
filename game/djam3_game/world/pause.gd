extends TextureButton


func _process(delta):
	if get_parent().menu_open:
		get_tree().paused = true
	else:
		get_tree().paused = false
