extends Node2D

@onready var gus: CharacterBody2D = $Gusi/Gus

func _ready() -> void:
	pass

func _on_gus_timer_timeout() -> void:
	var gusClone = gus.duplicate()
	$Gusi.add_child(gusClone)
	gusClone.global_position = gus.global_position


func _on_timer_timeout():
	pass
