extends Control

@export var gameLevel: PackedScene
@export var animationPlayer: AnimationPlayer
@export var backgroundOverlay: ColorRect

var last_focused_node: Control

func _ready() -> void:
	PlayerData.setup()
	_setup_ui_state()

	for tab in [%AreYouSureTab, %CreditsTab]:
		tab.opened.connect(_on_tab_opened)
		tab.closed.connect(_on_tab_closed)

func _setup_ui_state() -> void:
	if not PlayerData.first_time_playing:
		%LastNameScroll.update_name(PlayerData.data.name)
		%LastNameScroll.show()
	$Buttons/Start.grab_focus()

func _on_tab_opened() -> void:
	backgroundOverlay.show()
	$Buttons.hide()
	%NewHighscoreEntry.deactivate()

func _on_tab_closed() -> void:
	backgroundOverlay.hide()
	$ButtonsParent.show()
	if last_focused_node:
		last_focused_node.grab_focus()
