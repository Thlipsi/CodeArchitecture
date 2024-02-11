extends Control

@export var _dialog_text: Label
@export var _avatar: TextureRect
@export var _current_dialogue_tres: Dialogue

var _current_slide_index := 0

func _ready():
	_avatar.texture = _current_dialogue_tres.avatar_texture
	show_slide()


func _input(event):
	if event.is_action_pressed("advance_slide"):
		if _current_slide_index < _current_dialogue_tres.dialog_slides.size() - 1:
			_current_slide_index += 1
			show_slide()
		else:
			self.visible = false

func show_slide():
	_dialog_text.text = _current_dialogue_tres.dialog_slides[_current_slide_index]

