extends CharacterBody3D

@export var speed = 5.0
@export var gravity = 9.8

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	var input_dir = Vector3.ZERO
	input_dir.x = Input.get_axis("ui_left", "ui_right")
	input_dir.z = Input.get_axis("ui_up", "ui_down")
	if input_dir.length() > 0:
		input_dir = input_dir.normalized()
	velocity.x = input_dir.x * speed
	velocity.z = input_dir.z * speed
	move_and_slide()
