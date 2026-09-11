extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($Sprite2D, "modulate:a", .5, .5)
	tween.tween_property($Sprite2D, "modulate:a", .8, .5)
	tween.tween_property($Sprite2D, "modulate:a", .5, .5)
	tween.tween_property($Sprite2D, "modulate:a", 1, 1)
	await tween.finished
	if has_overlapping_areas(): Global.attackSet = "Mitosis"
	queue_free()
