extends Node2D


# Poisson rate (average number of arrivals per second)
@export var poisson_rate = 1.0

@export var queue = []

var time_until_next_arrival = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
	return -log(randf()) / poisson_rate

func add_client_to_queue():
	# TODO: need to maintain a queue
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
	else:
		print("Warning: handling a client when no clients are in queue")
		return
