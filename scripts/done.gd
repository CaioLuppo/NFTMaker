extends TextureButton

# Regula a cor do botão quando aperta ou solta
func _on_done_button_up():
	$"../../../ColorRect".visible = false
	pass

func _on_done_button_down():
	$"../../../ColorRect".visible = true
	pass
