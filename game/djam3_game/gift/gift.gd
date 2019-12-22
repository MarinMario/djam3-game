extends Node2D

var target: Vector2
var fall_speed = 1000
var despawn_timer := 0.0

func _ready():
	randomize()
	$Sprite.modulate = Color(rand_range(0,1), rand_range(0,1), rand_range(0,1))
	
	$Sprite.play("gift")
	self.position.y = -200
	self.position.x = target.x

func _process(delta):
	self.position.y += fall_speed * delta
	self.position.x -= global.building_speed * delta
	
	despawn_timer += delta
	if despawn_timer >= 5:
		despawn_timer = 0
		print("despawn gift")
		self.queue_free()

func _on_gift_area_entered(area):
	if area.is_in_group("horn"):
		global.score += 1
		global.get_node("gift_win").play()
		spawn_plusminus("plus")
		area.get_node("anim").play("flag")
		self.queue_free()
	elif area.is_in_group("void"):
		lose()

func spawn_plusminus(state):
	var plusminus = global.PLUS_MINUS.instance()
	plusminus.state = state
	get_parent().add_child(plusminus)


func _on_gift_body_entered(body):
	if body.is_in_group("house"):
		global.get_node("gift_lose").play()
		lose()


func lose():
	fall_speed = 0
	
	if global.score > 0:
		global.score -= 1
	
	spawn_plusminus("minus")
	self.disconnect("area_entered", self, "_on_gift_area_entered")
	$Sprite.play("explode")