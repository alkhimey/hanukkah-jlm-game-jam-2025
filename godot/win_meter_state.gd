extends Node

var win_state = 0
var time_passed = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_passed += delta
	if time_passed >= 2.0:
		time_passed = 0.0	
		if win_state >= 1:
			win_state -=1
		else:
			win_state = 0
	pass
