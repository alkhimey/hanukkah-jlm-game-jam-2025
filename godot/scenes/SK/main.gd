extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event):
	var work_mode = $WorkMode
	var fun_mode = $FunMode
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_TAB:
			if fun_mode.visible == true:
				work_mode.visible = true
				fun_mode.visible = false
			else:
				work_mode.visible = false
				fun_mode.visible = true
