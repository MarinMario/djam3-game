extends Node2D

var effects := AudioServer.get_bus_index("effects")

func _process(delta):
	AudioServer.set_bus_volume_db(effects, $sound_slider.value)


func _on_fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen