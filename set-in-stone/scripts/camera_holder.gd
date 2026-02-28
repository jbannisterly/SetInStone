extends Node3D

var CAM_ROT = 0.001
var rot_max = 0.4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseMotion):
		global_rotation.x += event.relative.y * CAM_ROT
		if global_rotation.x > rot_max:
			global_rotation.x = rot_max
		if global_rotation.x < -(rot_max):
			global_rotation.x = -(rot_max)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
