extends Node3D

@export var _dialogue: Dialogue

func _on_dialog_trigger_body_entered(body):
	if body.name == "Player":
		GameEvents.emit_signal("dialog_initiated", _dialogue)
