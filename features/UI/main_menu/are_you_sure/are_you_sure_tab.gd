extends BaseMenuTab

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_back_pressed() -> void:
	close()
