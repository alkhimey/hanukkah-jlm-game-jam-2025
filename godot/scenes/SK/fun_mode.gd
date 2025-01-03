extends Node2D

signal toggle_requested

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	$Button.focus_mode = Control.FOCUS_CLICK  # Prevent button from capturing focus
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var UI = $UI
	if self.visible == false:
		UI.visible = false
	else:
		UI.visible = true

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed == false and event.keycode == KEY_SPACE and is_visible_in_tree():
			$CardsSFX.play()
			WinMeterState.win_state += GameParameters.win_increase

func _on_button_button_up() -> void:
	WinMeterState.win_state += 1 


func _on_button_2_pressed() -> void:
	get_parent().toggle_modes()
	pass # Replace with function body.

func _on_texture_button_button_down() -> void:
	toggle_requested.emit()
