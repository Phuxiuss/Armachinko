extends BaseMenuTab

@export var loadSceneWhenQuitting : PackedScene

func _on_quit_pressed() -> void:
	if loadSceneWhenQuitting:
		get_tree().change_scene_to_packed(loadSceneWhenQuitting)
	get_tree().quit()

func _on_back_pressed() -> void:
	close()
