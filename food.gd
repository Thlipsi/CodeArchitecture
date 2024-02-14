extends Area3D

class_name Food

@export var spotlight: SpotLight3D

func _ready():
	GameEvents.connect("food_moused_over", _on_mouse_entered)
	GameEvents.connect("food_moused_out", _on_mouse_exited)

func _on_mouse_entered(food: Food):
	if food == self:
		spotlight.visible = true


func _on_mouse_exited():
	spotlight.visible = false
