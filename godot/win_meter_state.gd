extends Node

var win_state = 0
var time_passed = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	win_state = max(0, win_state - GameParameters.win_rate_decrease * delta)
