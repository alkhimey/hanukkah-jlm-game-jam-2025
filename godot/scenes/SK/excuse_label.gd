extends Label

var fade_out_rate = 0.7 # units per second. 1 is opace, 0 is transparent.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = ""
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.modulate.a = max(0, self.modulate.a - fade_out_rate * delta)
	pass


func _on_client_queue_excuse_changed(excuse: String) -> void:
	self.text = excuse
	self.modulate.a = 1
