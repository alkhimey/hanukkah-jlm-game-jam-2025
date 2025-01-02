extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func toggle_modes():
	var work_mode = $WorkMode
	var fun_mode = $FunMode
	if fun_mode.visible == true:
		work_mode.visible = true
		fun_mode.visible = false
	else:
		work_mode.visible = false
		fun_mode.visible = true
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_TAB:
			toggle_modes()
			#if fun_mode.visible == true:
				#work_mode.visible = true
				#fun_mode.visible = false
			#else:
				#work_mode.visible = false
				#fun_mode.visible = true
