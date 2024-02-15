extends Area3D

class_name Food

@export var spotlight: SpotLight3D
@export var food_name: String
@export var _spin_speed: float = 180

var _spin: bool = false
var _mesh: Node3D

func _ready():
	GameEvents.connect("food_moused_over", _on_mouse_entered)
	GameEvents.connect("food_moused_exit", _on_mouse_exited)
	for child in get_children():
		if child.get_class() == "Node3D":
			self.name = child.name
			_mesh = child
			

func _process(delta):
	if _spin and _mesh:
		_mesh.rotation_degrees.y += _spin_speed * delta
	elif _mesh.rotation_degrees.y != 0:
		_mesh.rotation_degrees.y = move_toward(_mesh.rotation_degrees.y, 0, 1)



func _on_mouse_entered(food: Food):
	if food == self:
		spotlight.visible = true
		_spin = true


func _on_mouse_exited():
	spotlight.visible = false
	_spin = false
