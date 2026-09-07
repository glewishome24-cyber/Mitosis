extends CharacterBody2D
@export var speed: float = 600.0
var canMove: bool

func randomize_direction() -> void:
	# Pick a random angle from 0 to 360 degrees (TAU radians)
	var direction = randf() * TAU
	velocity = Vector2.UP.rotated(direction) * speed
	print(velocity)

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
	print('bor x')

func _on_border_y_body_entered(body: Node2D) -> void:
	var new_vel = body.velocity.reflect(Vector2.LEFT)
	body.call_deferred("set", "velocity", new_vel)
	print('bor y')


func _on_sigma_body_entered(body: Node2D) -> void:
	print('dead')
	get_tree().change_scene_to_file("res://game_over.tscn")

func _on_gusi_child_entered_tree(node: Node) -> void:
	node.get_tree().create_timer(1).timeout
