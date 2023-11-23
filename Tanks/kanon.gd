extends Node2D

var bullet = preload("res://Tanks/bullet.tscn")

func _process(delta):
	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("ui_accept"):
		var instance = bullet.instantiate()
		instance.global_position = Vector2(global_position)
		get_parent().get_parent().add_child(instance)
		
