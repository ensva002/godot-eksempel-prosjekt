extends RigidBody2D

func _ready():
	look_at(get_global_mouse_position())

func _physics_process(delta):
	linear_velocity = Vector2.RIGHT.rotated(rotation) *800

