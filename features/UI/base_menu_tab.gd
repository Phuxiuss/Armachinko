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
	closed.emit()
	if animation_player:
		animation_player.play_backwards("fade_in")
		await animation_player.animation_finished
		hide()
	else:
		hide()
