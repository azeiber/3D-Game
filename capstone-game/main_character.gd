extends CharacterBody3D

@onready var camera_mount = $camera_mount
@onready var animation_player = $AnimationPlayer
@onready var visuals = $Rig

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var sens_horizontal = 0.5
@export var sens_vertical = 0.5
 
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var jumping = false
	
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event):
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x*sens_horizontal))
		visuals.rotate_y(deg_to_rad(event.relative.x*sens_horizontal))
		camera_mount.rotate_x(deg_to_rad(-event.relative.y*sens_vertical))
		camera_mount.rotation_degrees.x = clampf(camera_mount.rotation_degrees.x, -90, 45)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if animation_player.current_animation != "Walking_A":
			animation_player.play("Walking_A")
			
		visuals.look_at(position + direction)
		
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		if animation_player.current_animation == "Walking_A":
			animation_player.stop()
			animation_player.play("idle")
			
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
		velocity.z = move_toward(velocity.z, 0, SPEED * delta)
		
	if global_transform.origin.y < -7:
		get_tree().reload_current_scene()

	move_and_slide()
