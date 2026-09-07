extends Label
var time := 0
var timeStr = str(time)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_timer_timeout() -> void:	
	time += 1
	print(time)
	timeStr = str(time)
	set_text(timeStr)
	Global.time = time
