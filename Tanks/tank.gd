extends CharacterBody2D

var speed = 200
var sprite
var rot = 0

func _ready():
	sprite = $AnimatedSprite2D

func _physics_process(delta):
	var move_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		move_direction.x = 1
		rot = 270
	elif Input.is_action_pressed("ui_left"):
		move_direction.x = -1
		rot = 90
	if Input.is_action_pressed("ui_down"):
		move_direction.y = 1
		rot = 0
	elif Input.is_action_pressed("ui_up"):
		move_direction.y = -1
		rot = 180
		
	if move_direction == Vector2(1,1):
		rot = 315
	elif move_direction == Vector2(-1,-1):
		rot = 135
	elif move_direction == Vector2(1,-1):
		rot = 225
	elif move_direction == Vector2(-1,1):
		rot = 45
	

	sprite.rotation_degrees = rot

	velocity.x = move_toward(velocity.x, move_direction.x * speed, 5)
	velocity.y = move_toward(velocity.y, move_direction.y * speed, 5)
	

	move_and_slide()
