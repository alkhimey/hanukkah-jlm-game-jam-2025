extends Node2D

# Sends the size of the queue when it changes
signal queue_size(size: int)

signal toggle_requested

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var UI = $UI
	if self.visible == false:
		UI.visible = false
	else:
		UI.visible = true

func _on_client_queue_queue_size(size: int) -> void:
	queue_size.emit(size)


func _on_toggle_to_fun_button_button_down() -> void:
	toggle_requested.emit()
