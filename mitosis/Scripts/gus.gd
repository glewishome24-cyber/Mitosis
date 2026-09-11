extends CharacterBody2D
@export var speed: float = 600.0
var canMove: bool
var direction: float

func randomize_direction() -> void:
	
	var chosenRange = [
	Vector2(30, 60), 
	Vector2(120, 150), 
	Vector2(210, 240), 
	Vector2(300, 330)
	].pick_random()

	direction = randi_range(chosenRange.x, chosenRange.y)
	direction = deg_to_rad(direction)
	velocity = Vector2.RIGHT.rotated(direction) * speed

func _ready() -> void:
	canMove = false
	randomize_direction()
	await get_tree().create_timer(1.0).timeout
	canMove = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not canMove: return
	move_and_slide()

func _on_border_x_body_entered(body: Node2D) -> void:
	var new_vel = body.velocity.reflect(Vector2.UP)
	body.call_deferred("set", "velocity", new_vel)
	#print('bor x')

func _on_border_y_body_entered(body: Node2D) -> void:
	var new_vel = body.velocity.reflect(Vector2.LEFT)
	body.call_deferred("set", "velocity", new_vel)
	#print('bor y')


func _on_sigma_body_entered(body: Node2D) -> void:
	#print('dead')
	get_tree().change_scene_to_file.call_deferred("res://game_over.tscn")


func _on_set_change_timeout() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(571,112), 3)
	if Global.attackSet != "Mitosis": velocity = Vector2.ZERO
