extends Control

@export var levelScene: PackedScene = load("res://level.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = ("Time: " + str(Global.time))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
