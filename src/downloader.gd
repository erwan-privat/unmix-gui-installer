class_name Downloader
extends Node


signal progressed(percentage: int)

const FILE_SIZE := 1

# var _req := HTTPRequest.new()
@onready var _http : HTTPManager = $HTTPManager


func _ready() -> void:
	# add_child(_req)
	# _req.request_completed.connect(_on_done)
	pass

func download(uri: String, path: String) -> void:
	# _req.download_file = path
	# _req.request(uri)
	_http.job(uri).on_success(func (r):
		print(path)
	).fetch()


func _on_progress(_af, _cf, total_bytes, current_bytes) \
		-> void:
	progressed.emit(current_bytes * 100.0 / total_bytes)


func _on_done(
		_result: int,
		response_code: int,
		_headers: PackedStringArray,
		body: PackedByteArray) -> void:

	if response_code != 200:
		OS.alert("Error " + str(response_code) + ":\n" + str(body))

	print("on done")
	progressed.emit(100)
