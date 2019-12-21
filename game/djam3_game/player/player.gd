extends KinematicBody2D

var velocity: Vector2
var speed := 300
var gravity := 0
var motion := 0
var jump_height := 1500
var jump_count := 0
var anim := "move"

func _physics_process(delta):
	motion = 0
	$anims.play(anim)
	
	if Input.is_action_pressed("ui_right"):
		motion += 1
	if Input.is_action_pressed("ui_left"):
		motion -= 1
	
	if is_on_floor():
		gravity = 0
		jump_count = 0
	else:
		if Input.is_action_pressed("ui_down"):
			gravity += 1000
		else:
			gravity += 100
		
	
	if jump_count < 2:
		if Input.is_action_just_pressed("ui_up"):
			jump_count += 1
			gravity = -jump_height
	
	velocity = Vector2(motion * speed, gravity)
	move_and_slide(velocity, Vector2(0,-1))
	
	if Input.is_action_just_pressed("ui_accept"):
		spawn_gift()
	

func spawn_gift():
	var gift = global.GIFT.instance()
	gift.target = self.global_position
	get_parent().add_child(gift)
	
	
	
	
	
	