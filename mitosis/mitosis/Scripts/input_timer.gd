extends Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timeout() -> void:
	var inputType = Global.inputType
	if inputType == "WASD": inputType = "Mouse"
	elif inputType == "FollowMouse": inputType = "WASD"
	elif inputType == "Mouse": inputType = "FollowMouse"
	Global.inputType = inputType
	print(inputType)
	
