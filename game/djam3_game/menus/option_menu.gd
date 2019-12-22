extends Node2D

var sound := AudioServer.get_bus_index("effects")

func _ready():
	$sound_slider.value = global.sound_volume

func _process(delta):
	global.sound_volume = $sound_slider.value
	AudioServer.set_bus_volume_db(sound, $sound_slider.value)


func _on_fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen