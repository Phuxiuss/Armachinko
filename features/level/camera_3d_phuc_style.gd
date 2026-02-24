extends Camera3D

var player

func _physics_process(_delta: float) -> void:	
	position.y = get_parent().position.y - 1000
	position.x = get_parent().position.x 

	if position.y <= -40: 
		position.x = 0
		position.y = -40
