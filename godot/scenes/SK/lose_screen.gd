extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = get_tree().create_tween()
	$PhoneGameOver.volume_db = -30
	tween.tween_property($PhoneGameOver, "volume_db", 1, 1.25)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed == false and event.keycode == KEY_SPACE and is_visible_in_tree():
			LoseMeterState.lose_state = 0
			WinMeterState.win_state = 0
			get_tree().change_scene_to_file("res://scenes/SK/main.tscn")
