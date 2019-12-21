extends Node2D

var house_timer := 0.0
var city_bg_timer := 0.0

func _process(delta):
	house_timer += delta
	if house_timer > 1.5:
		spawn_house()
		house_timer = 0
	
	city_bg_timer += delta
	if city_bg_timer >= 19:
		city_bg_timer = 0
		spawn_city()
	
	$floor.position.x -= 500 * delta
	
	$score/label.text = str(global.score)

func spawn_house():
	var medium_house = global.MEDIUM_HOUSE.instance()
	var big_house = global.BIG_HOUSE.instance()
	var small_house = global.SMALL_HOUSE.instance()
	var house = [medium_house, big_house, small_house]
	add_child(house[randi()%house.size()])

func spawn_city():
	var city_bg = global.CITY_BG.instance()
	add_child(city_bg)

func _on_void_body_entered(body):
	if body.name == "player":
		get_tree().reload_current_scene()
