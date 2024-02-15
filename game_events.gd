extends Node

signal dialog_initiated(dialogue)
signal dialog_finished

signal food_moused_over
signal food_moused_exit
signal food_clicked

#fixes race condition by using call_deferred()
func emit_dialog_initiated(dialogue: Dialogue):
	call_deferred("emit_signal", "dialog_initiated", dialogue)


func emit_dialog_finished():
	call_deferred("emit_signal", "dialog_finished")
