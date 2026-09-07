extends Area2D

signal border_x_reflect

func _on_border_x_body_entered(body: Node2D) -> void:
	border_x_reflect.emit(body)
