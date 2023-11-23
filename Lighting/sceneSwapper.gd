extends Label


func _physics_process(delta):
	if Input.is_key_pressed(KEY_1):
		get_tree().change_scene_to_file("res://gui/menu.tscn")
	elif Input.is_key_pressed(KEY_2):
		get_tree().change_scene_to_file("res://Platformer/level1.tscn")
	elif Input.is_key_pressed(KEY_3):
		get_tree().change_scene_to_file("res://Tanks/tank_level.tscn")
	elif Input.is_key_pressed(KEY_4):
		get_tree().change_scene_to_file("res://Lighting/lightLevel.tscn")
	elif Input.is_key_pressed(KEY_5):
		get_tree().change_scene_to_file("res://FollowMouse/followMouse.tscn")
