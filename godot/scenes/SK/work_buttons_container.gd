extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_client_queue_request_cooldown(amount: float) -> void:
	var tween = get_tree().create_tween()
	$ApproveButton.disabled = true
	$DeclineButton.disabled = true

	var previous_position = self.position	
	var length = GameParameters.cooldown_work_buttons_length
	var new_pos = previous_position + Vector2(length / 2.0, 0)

	var travel_time = min(amount / 2.0, 0.75)
	var wait_time = max(0, amount - 2.0 * travel_time)

	tween.tween_property(self, "position", new_pos, travel_time / 2.0)
	tween.tween_property(self, "position", position, travel_time / 2.0).set_delay(wait_time)
	tween.tween_callback(enable_buttons)

func enable_buttons():
	$ApproveButton.disabled = false
	$DeclineButton.disabled = false
