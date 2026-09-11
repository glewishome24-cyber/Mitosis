extends StaticBody2D


func _on_set_change_timeout() -> void:
	var leftTween = create_tween()
	var rightTween = create_tween()
	leftTween.tween_property($leftWall, "position", Vector2(250,0), 2)
	rightTween.tween_property($rightWall, "position", Vector2(900,0), 2)
