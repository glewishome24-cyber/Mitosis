extends Area2D

var snakeScene = preload("res://snake.tscn")
var snakeInstance
var childCreated

func _ready() -> void:
	childCreated = false

func make_child(tarPos):
	if childCreated == false:
		snakeInstance = snakeScene.instantiate()
		$SnakeChild.add_child(snakeInstance)
		var bodyTexture = preload("res://Textures/SnakeBody.png")
		snakeInstance.get_node("SnakeSprite").texture = bodyTexture
		childCreated = true
	else: 
		snakeInstance.make_child(global_position)
	
	move(tarPos)

func move(tarPos):
	var lastPos = global_position
	global_position = tarPos
	if childCreated: snakeInstance.move(lastPos)
