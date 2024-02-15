extends Node3D

@export var _dialogue: Dialogue
@export var _dialogue_correct: Dialogue
@export var _dialogue_incorrect: Dialogue
@export var _correct_food: Food

func _on_dialog_trigger_body_entered(body):
	if body.name == "Player":
		GameEvents.emit_dialog_initiated(_dialogue)


func food_chosen(food: Food):
	if food == _correct_food:
		GameEvents.emit_dialog_initiated(_dialogue_correct)
	else:
		GameEvents.emit_dialog_initiated(_dialogue_incorrect)
