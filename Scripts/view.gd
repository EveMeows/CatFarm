extends Camera2D

@export var move_speed: float = 300.0
@export var shop: Control = null

func _process(delta: float) -> void:
	if shop != null:
		if shop.visible: return

	var size: Vector2 = get_viewport_rect().size

	if Input.is_action_pressed("camera_right"):
		if position.x + ((size.x * zoom.x) * 0.5) > limit_right: 
			return
		position.x += move_speed * delta
	elif Input.is_action_pressed("camera_left"):
		if position.x - ((size.x * zoom.x) * 0.5) < limit_left: 
			return
		position.x -= move_speed * delta
