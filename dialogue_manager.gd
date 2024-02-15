extends Control

@export var _dialog_text: Label
@export var _avatar: TextureRect
@export var _current_dialogue_tres: Dialogue
@export var _runtime_data: Resource

var _current_slide_index := 0

func _ready():
	_avatar.texture = _current_dialogue_tres.avatar_texture
	show_slide()
	GameEvents.connect("dialog_initiated", _on_dialog_initiated)
	GameEvents.connect("dialog_finished", _on_dialog_finished)


func _input(event):
	if event.is_action_pressed("advance_slide"):
		if _current_slide_index < _current_dialogue_tres.dialog_slides.size() - 1:
			_current_slide_index += 1
			show_slide()
		elif _runtime_data.current_gameplay_state == Enums.GameplayState.IN_DIALOG:
			GameEvents.emit_dialog_finished()
			

func show_slide():
	_dialog_text.text = _current_dialogue_tres.dialog_slides[_current_slide_index]
	

func _on_dialog_finished():
	_runtime_data.current_gameplay_state = Enums.GameplayState.FREEWALK
	self.visible = false

func _on_dialog_initiated(_dialogue: Dialogue):
	_runtime_data.current_gameplay_state = Enums.GameplayState.IN_DIALOG
	_current_dialogue_tres = _dialogue
	_current_slide_index = 0
	_avatar.texture = _current_dialogue_tres.avatar_texture
	show_slide()
	self.visible = true
