extends Control


var option_menu_up := false

func _ready():
	$anims.play("ready")

func _on_play_pressed():
	$anims.play_backwards("change")


func _on_exit_pressed():
	get_tree().quit()


func _on_options_pressed():
	option_menu_up = !option_menu_up
	
	if option_menu_up:
		$anims.play("options_menu")
	else:
		$anims.play_backwards("options_menu")


func _on_anims_animation_finished(anim_name):
	if anim_name == "change":
		get_tree().change_scene("res://world/world.tscn")
