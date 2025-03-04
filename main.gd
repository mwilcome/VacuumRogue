extends Node3D

@export var trash_scene: PackedScene = preload("res://trash.tscn")
@export var trash_count: int = 10

func _ready():
	spawn_trash()

func _process(_delta):
	if $TrashContainer.get_child_count() == 0:
		spawn_trash()

func spawn_trash():
	for i in range(trash_count):
		var trash = trash_scene.instantiate()
		$TrashContainer.add_child(trash)
		trash.position = Vector3(
			randf_range(-4.5, 4.5),
			0.1,
			randf_range(-4.5, 4.5)
		)
