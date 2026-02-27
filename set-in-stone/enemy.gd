extends CharacterBody3D

const SPEED = 5
var target = Vector3(0,0,0)
var total_delta = 0
var spawner = get_parent()

signal died

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#add_user_signal("died")
	pass # Replace with function body.


func _process(delta: float) -> void:
	total_delta += delta
	if total_delta > 2:
		target = Vector3(randf() * 1000 - 500, 0, randf() * 1000 - 500)
		total_delta = 0


func die() -> void:
	print("died sent")
	died.emit()
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	var direction := Vector3(target - position).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	position.y = 0
	
	if randf() > 0.99:
		die()
	
	pass
