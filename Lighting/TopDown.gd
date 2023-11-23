extends CharacterBody2D

var speed = 200
var anim
var fireballTscn = preload("res://Lighting/Fireball.tscn")
var fireballInstance
var previousDirection = Vector2(1,0)
var timer
var fireballReady = true

func _ready():
	anim = $AnimatedSprite2D
	timer = $Timer

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed('ui_right'):
		direction.x += 1
		anim.play("wRight")
	elif Input.is_action_pressed('ui_left'):
		direction.x -= 1
		anim.play("wLeft")		
	elif Input.is_action_pressed('ui_down'):
		direction.y += 1
		anim.play("wDown")
	elif Input.is_action_pressed('ui_up'):
		direction.y -= 1
		anim.play("wUp")
	else:
		anim.pause()
	
	if direction:
		previousDirection = direction
	
	#Shoot fireball in facing direction
	if Input.is_action_just_pressed("ui_accept") && fireballReady:
		fireballInstance = fireballTscn.instantiate()
		fireballInstance.initialize(previousDirection,position)
		get_parent().add_child(fireballInstance)
		$AudioStreamPlayer2D.play()
		fireballReady = false
		timer.start()

	velocity = direction.normalized() * speed

	move_and_slide()


func _on_timer_timeout():
	fireballReady = true
