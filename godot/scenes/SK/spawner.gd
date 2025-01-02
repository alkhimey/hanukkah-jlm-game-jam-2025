extends Node2D

# Sends the top of the queue when it changes.
signal request_changed(request: String)

# Sends the top of the queue when it changes.
signal excuse_changed(excuse: String)

# Sends the size of the queue when it changes
signal queue_size(size: int)

@export var queue = []

var time_until_next_arrival = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	queue_size.emit(queue.size())
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var lose_change = GameParameters.lose_rate * queue.size() * delta
	LoseMeterState.lose_state =  min(LoseMeterState.lose_state + lose_change, 100)
		
	time_until_next_arrival -= delta

	# Check if a new client has arrived
	if time_until_next_arrival <= 0:
		add_client_to_queue()
		time_until_next_arrival = generate_inter_arrival_time()
	pass

func generate_inter_arrival_time():
	# Generate a random inter-arrival time using the exponential distribution
	return -log(randf()) / GameParameters.client_arrival_rate

func add_client_to_queue():
	if queue.size() >= GameParameters.max_clients_in_queue:
		return
	
	var client_scene = load("scenes/SK/Client.tscn")
	var client_instance = client_scene.instantiate()
	add_child(client_instance)

	var screen_size = get_viewport().get_visible_rect().size
	var random_position = Vector2(
		randf_range(screen_size.x / 4.0, 3.0 * screen_size.x / 4.0),
		#randf_range(0, screen_size.y)
		screen_size.y / 2 
	)
	client_instance.position = random_position
	queue.append(client_instance)
	queue_size.emit(queue.size())

	emit_request_after_queue_update()

func emit_request_after_queue_update():
	if queue.size() > 0:
		request_changed.emit(queue.front().request)
	else:
		request_changed.emit("")


func _on_approve_button_button_down() -> void:
	print("Approve pressed!")

func _on_decline_button_button_down() -> void:
	if handle_client():
		$DeclineAudioStreamPlayer.play()

func handle_client() -> bool:
	if queue.size() > 0:
		var client_instance = queue.pop_front()
		queue_size.emit(queue.size())
		remove_child(client_instance)
		excuse_changed.emit(client_instance.excuse)
		emit_request_after_queue_update()
		return true
	else:
		print("Warning: handling a client when no clients are in queue")
		return false
