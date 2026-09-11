extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tree = $ScoreList
	var root = tree.create_item()
	var title: TreeItem = tree.create_item(root)
	title.set_text(0, "Attempt #")
	title.set_text_alignment(0, HORIZONTAL_ALIGNMENT_CENTER)
	title.set_text(1, "Time")
	title.set_text_alignment(1, HORIZONTAL_ALIGNMENT_CENTER)
	
	title.set_custom_color(0, Color.ALICE_BLUE)
	title.set_custom_color(1, Color.ALICE_BLUE)
	title.set_custom_font_size(0, 25)
	title.set_custom_font_size(1, 25)
	
	var timesList= Global.timesList
	var attempt = 1
	var timesListMax = timesList.max()
	
	for item in timesList:
		var row: TreeItem = tree.create_item(root)
		row.set_text(0, str(attempt))
		row.set_text_alignment(0, HORIZONTAL_ALIGNMENT_CENTER)
		row.set_text(1, "%0.1f" % item)
		row.set_text_alignment(1, HORIZONTAL_ALIGNMENT_CENTER)
		if item == timesListMax: 
			row.set_custom_bg_color(1, Color.GOLDENROD)
			row.set_custom_bg_color(0, Color.GOLDENROD)
		attempt += 1


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://level.tscn")
