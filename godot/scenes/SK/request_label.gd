extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_client_queue_request_changed(request: String) -> void:
	if request == null:
		self.text = ""
	else:
		self.text = request
	pass # Replace with function body.
