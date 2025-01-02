extends Node2D

@export var queue = []

var time_until_next_arrival = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var lose_change = GameParameters.lose_rate * queue.size() * delta
	LoseMeterState.lose_state =  min(LoseMeterState.lose_state + lose_change, 100)
	
	print("Lose points:", LoseMeterState.lose_state)
	
	time_until_next_arrival -= delta

	# Check if a new client has arrived
	if time_until_next_arrival <= 0:
		add_client_to_queue()
		print("Client arrived")
		# Generate the next inter-arrival time
		time_until_next_arrival = generate_inter_arrival_time()
	pass

func generate_inter_arrival_time():
	# Generate a random inter-arrival time using the exponential distribution
	return -log(randf()) / GameParameters.client_arrival_rate

func add_client_to_queue():
	var client_scene = load("scenes/SK/Client.tscn")
	var client_instance = client_scene.instantiate()
	add_child(client_instance)

	var screen_size = get_viewport().get_visible_rect().size
	var random_position = Vector2(
		randf_range(0, screen_size.x),
		randf_range(0, screen_size.y)
	)
	client_instance.position = random_position
	queue.append(client_instance)

func _on_handle_last_client_button_button_down() -> void:
	if queue.size() > 0:
		var client_instance = queue.pop_front()
		remove_child(client_instance)
		print("Client handled")
	else:
		print("Warning: handling a client when no clients are in queue")
		return
