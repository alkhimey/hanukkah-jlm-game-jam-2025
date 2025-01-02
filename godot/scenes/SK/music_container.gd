extends Node2D

const min_noise = 0.6
const max_noise = 1.0

var drums_playback_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_work_mode_queue_size(size: int) -> void:
	#db_to_linear(0)
	if size <= 0:
		$BGNoiseAudioStreamPlayer.stop()
	else:
		if $BGNoiseAudioStreamPlayer.playing == false:
			$BGNoiseAudioStreamPlayer.play()	
		var safe_size = min(size, GameParameters.max_clients_in_queue)
		var noise_level = remap(safe_size, 1.0, GameParameters.max_clients_in_queue, min_noise, max_noise)
		$BGNoiseAudioStreamPlayer.volume_db = linear_to_db(noise_level)

func work_mode_selected():
	$DrumsAudioStreamPlayer.play()
	$DrumsAudioStreamPlayer.seek($MusicAudioStreamPlayer.get_playback_position())
	
func fun_mode_selected():
	$DrumsAudioStreamPlayer.stop()
