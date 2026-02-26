extends Control

@export var gameLevel: PackedScene
@export var animationPlayer: AnimationPlayer
@export var backgroundOverlay: ColorRect
@export var buttonsParent : Control

var last_focused_node: Control

func _ready() -> void:
	PlayerData.setup()
	_setup_ui_state()

	for tab in [%AreYouSureTab, %CreditsTab, %SettingsTab, %CreditsTab, %HighscoreTab, %EnterNameTab]:
		tab.opened.connect(_on_tab_opened)
		tab.closed.connect(_on_tab_closed)

func _setup_ui_state() -> void:
	if not PlayerData.first_time_playing:
		%LastNameScroll.update_name(PlayerData.data.name)
		$AnimationPlayer.play("enter_name_tab") 
		%LastNameScroll.open()
		%LastNameScroll/StartButton.grab_focus()
		$Buttons/Start.disabled = true
	else:
		$Buttons/Start.disabled = false
		$Buttons/Start.grab_focus()

func _on_tab_opened() -> void:
	backgroundOverlay.show()
	buttonsParent.hide()
	%NewHighscoreEntry.deactivate()

func load_game() -> void:
	get_tree().change_scene_to_packed(gameLevel)

func _on_tab_closed() -> void:
	backgroundOverlay.hide()
	buttonsParent.show()
	if last_focused_node:
		last_focused_node.grab_focus()
