extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("space"):
		WinMeterState.win_state += 1 


func _on_button_pressed() -> void:
	WinMeterState.win_state += 1 
