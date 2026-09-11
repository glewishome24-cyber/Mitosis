extends Node2D

@onready var gus: CharacterBody2D = $Gus

func _ready() -> void:
	$MineFieldSprite.modulate.a = 0

func _on_gus_timer_timeout() -> void:
	var gusClone = gus.duplicate()
	$Gusi.add_child(gusClone)
	

func _on_timer_timeout():
	pass


func _on_set_change_timeout() -> void:
	await get_tree().create_timer(1.0).timeout
	if Global.attackSet == "Mines":
		var tween = create_tween()
		tween.tween_property($FieldSprite, "modulate:a", 0.0, 2.5)
		tween.tween_property($MineFieldSprite, "modulate:a", 1.0, 2)
		while true:
			if Global.attackSet != "Mines": break
			await get_tree().create_timer(3.0).timeout
			set_minefield(5)
	elif Global.attackSet == "Snake":
		await get_tree().create_timer(2.0).timeout
		var snakeScene = preload("res://snake.tscn")
		var snakeInstance = snakeScene.instantiate()
		add_child(snakeInstance)
		while true:
			var result = random_direction(snakeInstance.global_position, null)
			var targetPos = result[0]
			var lastDir = (result[1] * -1)
			print(lastDir)
			snakeInstance.move(targetPos)
			await get_tree().create_timer(3.0).timeout
			result = random_direction(snakeInstance.global_position, lastDir)
			targetPos = result[0]
			lastDir = (result[1] * -1)
			snakeInstance.make_child(targetPos)
			print('make child')
			await get_tree().create_timer(3.0).timeout
	
	
func random_direction(currentPos, lastDir):
	var step = 70
	var randDirection = [Vector2(1,0), Vector2(-1,0), Vector2(0,1), Vector2(0,-1)].pick_random()
	while lastDir == randDirection:
		randDirection = [Vector2(1,0), Vector2(-1,0), Vector2(0,1), Vector2(0,-1)].pick_random()
	var targetPosition: Vector2 = currentPos + (randDirection * step)
	
	return [targetPosition, randDirection]
	
	
func set_minefield(mines):
	var mineScene = preload("res://mine.tscn")
	
	var mineFieldArray: Array = []
	mineFieldArray.resize(64)
	mineFieldArray.fill(0)
	
	while mineFieldArray.count(1) != mines:
		var rand = randi_range(0, 63)
		if mineFieldArray[rand] == 0:
			mineFieldArray[rand] = 1
	
	for i in range(mineFieldArray.size()):
		if mineFieldArray[i] == 1:
			var mineInstance = mineScene.instantiate()
			$Mines.add_child(mineInstance)
			var column: int = i / 8
			var row = i % 8
			var gridPosition =  Vector2((column * 72) + 317, (row * 72) + 68)
			mineInstance.global_position = gridPosition
			mineFieldArray[mineFieldArray.find(1)] = 0
