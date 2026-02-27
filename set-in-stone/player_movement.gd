extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const CAM_ROT = -0.001

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseMotion):
		global_rotation.y += event.relative.x * CAM_ROT

func _ready() -> void:
	
	pass

func _physics_process(delta: float) -> void:
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var input_dir = Vector3(0,0,0)
	
	input_dir.x = 0
	input_dir.y = 0
	input_dir.z = 0
	
	if (Input.is_key_pressed(KEY_W)):
		input_dir.z += 1
	if (Input.is_key_pressed(KEY_S)):
		input_dir.z -= 1
	if (Input.is_key_pressed(KEY_D)):
		input_dir.x -= 1
	if (Input.is_key_pressed(KEY_A)):
		input_dir.x += 1
		
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.z)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
		
	if position.y < 0:
		position.y = 0
