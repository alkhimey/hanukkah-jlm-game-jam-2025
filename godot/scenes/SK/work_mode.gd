extends Node2D

# Sends the size of the queue when it changes
signal queue_size(size: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var UI = $UI
	if self.visible == false:
		UI.visible = false
	else:
		UI.visible = true
	pass

#func _unhandled_input(event):
	#if event is InputEventKey:
		#if event.pressed and event.keycode == KEY_TAB:
			#get_tree().change_scene_to_file("res://scenes/SK/fun_mode.tscn")


func _on_client_queue_queue_size(size: int) -> void:
	queue_size.emit(size)
