extends Timer


func _on_set_change_timeout() -> void:
	print("gus timer rm")
	queue_free()
