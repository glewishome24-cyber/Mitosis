extends CharacterBody2D

@export var SPEED: float = 500.0
var direction

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED

func _on_input_timer_timeout() -> void:
	Input.warp_mouse(global_position)
	pass

func _process(delta: float) -> void:
	var inputType = Global.inputType
	if inputType == "WASD":
		direction = Input.get_vector("Left", "Right", "Up", "Down")
		velocity = direction * SPEED
		Input.warp_mouse(global_position)
	elif inputType == "Mouse":
		global_position = get_global_mouse_position()
	elif inputType == "FollowMouse":
		direction = global_position.direction_to(get_global_mouse_position())
		velocity = direction * SPEED
		if global_position.distance_to(get_global_mouse_position()) < 5: 
			velocity = Vector2.ZERO
	
	move_and_slide()
	
	
	#var target_pos = get_global_mouse_position()
	#var next_position = global_position.move_toward(target_pos, SPEED * delta) 
	#velocity = (next_position - global_position) / delta
