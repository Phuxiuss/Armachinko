extends BaseMenuTab

@export var loadSceneWhenQuitting : PackedScene

func _on_quit_pressed() -> void:
	if loadSceneWhenQuitting != null:
		get_tree().paused = false
		Globals.update_highscore_data(PlayerData.data)	
		Globals.unset_fresh_session()
		get_tree().change_scene_to_packed(loadSceneWhenQuitting)
	else:
		get_tree().quit()


func _on_back_pressed() -> void:
	close()
