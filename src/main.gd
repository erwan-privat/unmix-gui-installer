extends PanelContainer


var skip_umx: bool


func _on_do_not_install_umx_btn_toggled(toggled_on: bool) -> void:
	skip_umx = toggled_on


func _on_install() -> void:
	%Console.append_text("install")


func _on_quit() -> void:
	get_tree().quit()
