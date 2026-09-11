extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label2.text = Global.inputType


func _on_main_timer_timeout() -> void:
	$Label.text = "%0.1f" % Global.time

func _on_input_timer_timeout() -> void:
	$Label2.text = Global.inputType
