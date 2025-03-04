extends CharacterBody3D

@export var speed = 5.0
@export var gravity = 9.8
var score = 0
@onready var score_label = get_node("../UI/ScoreLabel")

func _ready():
	$SuctionZone.body_entered.connect(_on_suction_zone_body_entered)

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

func _on_suction_zone_body_entered(body):
	if body.is_in_group("trash"):
		body.queue_free()
		score += 1
		score_label.text = "Score: " + str(score)
