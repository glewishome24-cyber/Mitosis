extends Control

@export var levelScene: PackedScene = load("res://level.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.timesList.append(Global.time)
	$Label.text = ("Time: " + "%0.1f" % Global.time)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
