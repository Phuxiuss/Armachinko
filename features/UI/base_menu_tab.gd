extends Control
class_name BaseMenuTab

signal opened
signal closed

@export var animation_player: AnimationPlayer

func open():
	show()
	opened.emit()
	if animation_player:
		animation_player.play("fade_in")

func close():
	hide()
	closed.emit()
	if animation_player:
		animation_player.play("fade_out")
