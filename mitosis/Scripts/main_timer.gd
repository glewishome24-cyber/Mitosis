extends Timer


var time = 0.0
var timeStr = str(time)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_timeout() -> void:
	time += 0.1
	Global.time = time
	#print(Global.time)
