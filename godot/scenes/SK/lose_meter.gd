extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var progress_bar = $ProgressBar
	progress_bar.value = LoseMeterState.lose_state

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var progress_bar = $ProgressBar
	progress_bar.value = LoseMeterState.lose_state
