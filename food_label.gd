extends Label

func _ready():
	GameEvents.connect("food_moused_over", on_food_hovered)
	GameEvents.connect("food_moused_exit", on_food_unhovered)

func on_food_hovered(food: Food):
	self.text = food.name
	self.visible = true


func on_food_unhovered():
	self.visible = false
