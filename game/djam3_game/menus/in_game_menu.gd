extends Node2D

var options_open := false
var change_to = "res://menus/main_menu.tscn"

func _on_options_pressed():
	if !options_open:
		$anims.play("options")
	else:
		$anims.play_backwards("options")
	
	options_open = !options_open


func _on_exit_pressed():
	get_tree().paused = false
	$anims.play("trans")
	change_to = "res://menus/main_menu.tscn"


func _on_anims_animation_finished(anim_name):
	if anim_name == "trans":
		get_tree().change_scene(change_to)


func _on_retry_pressed():
	get_tree().paused = false
	$anims.play("trans")
	change_to = "res://world/world.tscn"
