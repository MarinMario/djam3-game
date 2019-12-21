extends Node2D

var house_timer := 0.0

func _process(delta):
	house_timer += delta
	if house_timer > 1.5:
		spawn_house()
		house_timer = 0
	
	$floor.position.x -= 500 * delta
	
	$score/label.text = str(global.score)

func spawn_house():
	var medium_house = global.MEDIUM_HOUSE.instance()
	var big_house = global.BIG_HOUSE.instance()
	var small_house = global.SMALL_HOUSE.instance()
	var house = [medium_house, big_house, small_house]
	add_child(house[randi()%house.size()])

func _on_void_body_entered(body):
	if body.name == "player":
		get_tree().reload_current_scene()
