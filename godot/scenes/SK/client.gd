extends Node2D

@export var request: String
@export var excuse: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var requestExcuse = GameData.request_excuses.pick_random()
	request = requestExcuse.request
	excuse = requestExcuse.excuse

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
