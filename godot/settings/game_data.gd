extends Node

class RequestExcuse:
	var request: String
	var excuse: String
	
	func _init(request: String, excuse: String):
		self.request = request
		self.excuse = excuse
		
	func _to_string() -> String:
		return "Request: %s, Excuse: %s" % [self.request, self.excuse]

var request_excuses = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file = FileAccess.open("res://excuses.json", FileAccess.READ)
	if file == null:
		print("File not found")
		#OS.exit(1)
		return

	var json_data = JSON.parse_string(file.get_as_text())
	file.close()

	for entry in json_data:
		var request_excuse = RequestExcuse.new(entry["request"], entry["excuse"])
		request_excuses.append(request_excuse)

	print("Loaded requests/excuses:", request_excuses.size())

func _process(delta: float) -> void:
	pass
