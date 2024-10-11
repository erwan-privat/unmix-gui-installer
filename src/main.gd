extends PanelContainer


@onready var csl := %Console


var _skip_umx: bool


func clog(text: String) -> void:
	print(text)
	csl.append_text(text)
	csl.append_text("\n")


func _on_no_umx(toggled_on: bool) -> void:
	_skip_umx = toggled_on


func _on_install() -> void:
	clog("install")
	
	var url = %UmxUrlTxt.text
	var path = %InstallPathTxt.text
	clog("Downlading test file " + url + " in " + path)
	
	%Downloader.download(url, path)
	

func _on_progress(percentage: int) -> void:
	%Progress.value = percentage


func _on_quit() -> void:
	clog("quit")
	# get_tree().root.propagate_notification(
	# 		NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()


func error(msg: String) -> void:
	printerr(msg)
	var ed := %ErrorDialog
	ed.dialog_text = msg
	ed.popup_centered()
