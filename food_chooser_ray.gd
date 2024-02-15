extends RayCast3D

var _is_mousing_over := false

func _input(event):
	var collided_area: Area3D = get_collider()
	if collided_area is Food:
		if not _is_mousing_over:
			_is_mousing_over = true
			GameEvents.emit_signal("food_moused_over", collided_area)
	elif _is_mousing_over:
		_is_mousing_over = false
		GameEvents.emit_signal("food_moused_exit")
