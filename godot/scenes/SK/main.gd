extends Node2D

@onready var work_mode = $WorkMode
@onready var fun_mode = $FunMode

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$WorkMode.visible = false
	$FunMode.visible = true
	$MusicContainer.fun_mode_selected()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_work_mode_toggle_requested() -> void:
	print("to fun")
	work_mode.visible = false
	fun_mode.visible = true
	$MusicContainer.fun_mode_selected()
	$ToggleSFX/ToggleToFun.play()

func _on_fun_mode_toggle_requested() -> void:
	print("to work")
	work_mode.visible = true
	fun_mode.visible = false
	$MusicContainer.work_mode_selected()
	$ToggleSFX/ToggleToWork.play()
