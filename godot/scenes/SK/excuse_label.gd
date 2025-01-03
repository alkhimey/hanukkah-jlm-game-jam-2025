extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = ""
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.text.length() > 0:
		var total_length = 0
		for excuse in GameData.excuses:
			total_length += excuse.length()
		var avg_length = total_length / GameData.excuses.size()
		
		var text_length_factor = avg_length / self.text.length() # smaller -> longer
		var a_delta = GameParameters.excuse_fade_out_rate * delta * text_length_factor
		self.modulate.a = max(0, self.modulate.a - a_delta)


func _on_client_queue_excuse_changed(excuse: String) -> void:
	self.text = excuse
	self.modulate.a = 1
