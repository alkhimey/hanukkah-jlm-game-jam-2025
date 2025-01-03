extends Node

class RequestExcuse:
	var request: String
	var excuse: String
	
	func _init(_request: String, _excuse: String):
		self.request = _request
		self.excuse = _excuse
		
	func _to_string() -> String:
		return "Request: %s, Excuse: %s" % [self.request, self.excuse]

var request_excuses = []

var requests = []
var excuses = []

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

	load_file_into_array("res://requests.txt", requests)
	load_file_into_array("res://excuses.txt", excuses)

	
func load_file_into_array(file_name: String, lines: Array):
	var file = FileAccess.open(file_name, FileAccess.READ)

	if file:
		while not file.eof_reached():
			var line = file.get_line()
			lines.append(line)
		#var content = file.get_as_text()
		#print(content)
		file.close()
		#lines = content.split("\n")
		
		print("Loaded ", requests.size()," lines from file: ", file_name)
		return
	else:
		print("Error opening file")

func _process(delta: float) -> void:
	pass
