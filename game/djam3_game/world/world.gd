extends Node2D

var house_timer := 0.0
var city_bg_timer := 0.0
var speed_up_timer := 0.0
var menu_open := false
var can_close_menu := true
var building_speed := 0

func _ready():
	$anims.play("ready")
	global.building_speed = 500
	global.score = 0
	get_tree().paused = false
	can_close_menu = true

func _process(delta):
	house_timer += delta
	if house_timer > 1.5:
		spawn_house()
		house_timer = 0
	
	city_bg_timer += delta
	if city_bg_timer >= 19:
		city_bg_timer = 0
		spawn_city()
	
	speed_up_timer += delta
	if global.building_speed < 1000:
		if speed_up_timer > 1:
			speed_up_timer = 0
			global.building_speed += 4
	
		
	if Input.is_action_just_pressed("ui_cancel"):
		menu()
	
	$floor.position.x -= 500 * delta
	
	$score/label.text = str(global.score)
	$best_score/label.text = str(global.best_score)


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
	if body.name == "player" and !menu_open:
		$anims.play("menu")
		can_close_menu = false
		$player.allow_gift = false
		if global.score > global.best_score:
			global.best_score = global.score
		
		yield(get_tree().create_timer(0.5), "timeout")
		$anims.play("lose")

func _on_pause_pressed():
	menu()

func menu():
	if can_close_menu:
		if menu_open:
			$anims.play_backwards("menu")
		else:
			$anims.play("menu")
	
	menu_open = !menu_open