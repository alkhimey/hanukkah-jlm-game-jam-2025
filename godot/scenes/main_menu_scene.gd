extends Node2D

var game_scene
@export var settings_scene:PackedScene

@onready var overlay := %FadeOverlay
@onready var new_game_button := %NewGameButton
@onready var settings_button := %SettingsButton
@onready var exit_button := %ExitButton

var next_scene = settings_scene
var new_game = true

func _ready() -> void:
	game_scene = load("res://scenes/SK/main.tscn")
	overlay.visible = true
	new_game_button.disabled = game_scene == null
	settings_button.disabled = settings_scene == null
	
	# connect signals
	new_game_button.pressed.connect(_on_play_button_pressed)
	settings_button.pressed.connect(_on_settings_button_pressed)
	exit_button.pressed.connect(_on_exit_button_pressed)
	overlay.on_complete_fade_out.connect(_on_fade_overlay_on_complete_fade_out)
	

	new_game_button.grab_focus()

func _on_settings_button_pressed() -> void:
	$UISFX.play()
	new_game = false
	next_scene = settings_scene
	overlay.fade_out()
	
func _on_play_button_pressed() -> void:
	$UISFX.play()
	next_scene = game_scene
	overlay.fade_out()

func _on_exit_button_pressed() ->	 void:
	$UISFX.play()
	get_tree().quit()

func _on_fade_overlay_on_complete_fade_out() -> void:
	if new_game and SaveGame.has_save():
		SaveGame.delete_save()
	get_tree().change_scene_to_packed(next_scene)
