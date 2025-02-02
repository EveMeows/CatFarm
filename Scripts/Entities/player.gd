extends CharacterBody2D

# Handled by the game
@export var camera: Camera2D

# Handled in the player class
@export var left: RayCast2D
@export var right: RayCast2D

@export var speed: float = 35.0
@export var acceleration: float = 4.5
 
@export var stop_offset: int = 10

var direction: int = 1


func handle_mouse(mouse: Vector2) -> void:
	if mouse.x < position.x + stop_offset && mouse.x > position.x - stop_offset:
		direction = 0
		return
		
	direction = -1 if position.x > mouse.x else 1


func handle_raycast(mouse: Vector2) -> void:
	if not is_on_floor(): return
	
	if (not right.is_colliding() and mouse.x > position.x) or (not left.is_colliding() and mouse.x < position.x):
		direction = 0


func _physics_process(delta: float) -> void:
	# Apply gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Very high performance code
	var mouse: Vector2 = camera.get_global_mouse_position()
	handle_mouse(mouse); handle_raycast(mouse)

	velocity.x = move_toward(velocity.x, speed * direction, acceleration)
	move_and_slide()


func mouse_entered() -> void:
	direction = 0
