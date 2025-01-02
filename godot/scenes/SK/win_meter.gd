extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var progress_bar = $ProgressBar
	progress_bar.value = WinMeterState.win_state
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var progress_bar = $ProgressBar
	progress_bar.value = WinMeterState.win_state
	if progress_bar.value >= progress_bar.max_value:
		get_tree().change_scene_to_file("res://scenes/SK/win_screen.tscn")
	pass
