extends Node2D

func _on_set_change_timeout():
	for child in get_children():
		child.queue_free()
