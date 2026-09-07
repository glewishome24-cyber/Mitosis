extends CharacterBody2D

var SPEED: float = 600.0
var InputType

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	InputType = "Mouse"

func _on_input_timer_timeout() -> void:
	if InputType == "WASD": 
		InputType = "Mouse"
		Input.warp_mouse(global_position)
	elif InputType == "Mouse": InputType = "WASD"
	print(InputType)

func _process(delta: float) -> void:
	if InputType == "WASD":
		var direction = Input.get_vector("Left", "Right", "Up", "Down")
		velocity = direction * SPEED
	elif InputType == "Mouse":
		global_position = get_global_mouse_position()
		
	Input.warp_mouse(global_position)
	move_and_slide()
	
	
	#var target_pos = get_global_mouse_position()
	#var next_position = global_position.move_toward(target_pos, SPEED * delta) 
	#velocity = (next_position - global_position) / delta
