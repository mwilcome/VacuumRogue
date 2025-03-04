extends Node3D

@export var trash_scene: PackedScene = preload("res://trash.tscn")
@export var trash_count: int = 10

func _ready():
	spawn_trash()

func spawn_trash():
	for i in range(trash_count):
		var trash = trash_scene.instantiate()
		$TrashContainer.add_child(trash)
		trash.position = Vector3(
			randf_range(-4.5, 4.5),  # X: Within floor bounds (10 wide)
			0.1,                    # Y: On floor surface
			randf_range(-4.5, 4.5)  # Z: Within floor bounds (10 deep)
		)
