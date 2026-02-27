extends Control

@export var backgroundOverlay: ColorRect
@export var buttonsParent : Control
var last_focused_node: Control

signal continued

func _ready() -> void:
	for tab in [$AreYouSureTab, $SettingsTab]:
		if tab is BaseMenuTab:
			tab.opened.connect(_on_tab_opened)
			tab.closed.connect(_on_tab_closed)

func _on_tab_opened() -> void:
	if backgroundOverlay:
		backgroundOverlay.show()
	if buttonsParent:
		buttonsParent.hide()

func restart_current_scene() -> void:
	get_tree().reload_current_scene()

func continue_game() -> void:
	hide()
	continued.emit()

func _on_tab_closed() -> void:
	if backgroundOverlay:
		backgroundOverlay.hide()
	if buttonsParent:
		buttonsParent.show()
	if last_focused_node:
		last_focused_node.grab_focus()
