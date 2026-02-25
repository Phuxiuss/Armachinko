extends Button
class_name BaseMenuButton

@export var hover_sound: AudioStream
@export var press_sound: AudioStream

func _ready():
	pressed.connect(_on_pressed)
	focus_entered.connect(_on_focus_entered)

func _on_pressed():
	# Play global audio or emit signal
	pass

func _on_focus_entered():
	# Logic to track "last_button" automatically
	pass
