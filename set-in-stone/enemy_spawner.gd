extends Node3D

var enemy = preload("res://Enemy.tscn")
var enemy_count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function bodywawdssd.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if enemy_count < 10:
		add_child(enemy.instantiate())
		enemy_count += 1
	
	pass
