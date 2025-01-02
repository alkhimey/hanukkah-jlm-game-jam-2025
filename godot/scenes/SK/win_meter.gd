extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var win_progress_bar = $CanvasLayer/WinProgressBar
	win_progress_bar.value = WinMeterState.win_state
	
	var lose_progress_bar = $CanvasLayer/LoseProgressBar
	lose_progress_bar.value = LoseMeterState.lose_state
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var win_progress_bar = $CanvasLayer/WinProgressBar
	win_progress_bar.value = WinMeterState.win_state
	if win_progress_bar.value >= win_progress_bar.max_value:
		get_tree().change_scene_to_file("res://scenes/SK/win_screen.tscn")
		
	var lose_progress_bar = $CanvasLayer/LoseProgressBar
	lose_progress_bar.value = LoseMeterState.lose_state
	if lose_progress_bar.value >= lose_progress_bar.max_value:
		get_tree().change_scene_to_file("res://scenes/SK/lose_screen.tscn")

	pass
