extends Timer

func _on_timeout() -> void:
	var attackSet = Global.attackSet
	if attackSet == "Mitosis": attackSet = "Snake"
	elif attackSet == "Snake": attackSet = "Mines"
	else: attackSet = "Mitosis"
	Global.attackSet = attackSet
	print(attackSet)
