extends CharacterBody3D

@export var speed = 5.0
@export var gravity = 9.8
var score = 0

func _ready():
	# Connect the suction zone's signal
	$SuctionZone.body_entered.connect(_on_suction_zone_body_entered)

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Get input direction
	var input_dir = Vector3.ZERO
	input_dir.x = Input.get_axis("ui_left", "ui_right")
	input_dir.z = Input.get_axis("ui_up", "ui_down")
	
	# Normalize to prevent faster diagonal movement
	if input_dir.length() > 0:
		input_dir = input_dir.normalized()
	
	# Set horizontal velocity
	velocity.x = input_dir.x * speed
	velocity.z = input_dir.z * speed
	
	# Move the vacuum
	move_and_slide()

func _on_suction_zone_body_entered(body):
	if body.is_in_group("trash"):
		body.queue_free()  # Remove the trash
		score += 1
		print("Score: ", score)  # Temporary debug output
