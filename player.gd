extends CharacterBody3D

func _input(event) -> void:
	var mouse_motion = event as InputEventMouseMotion
	if mouse_motion:
		print(mouse_motion.relative.x)
