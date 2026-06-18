extends PanelContainer

func _ready() -> void:
	hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("inventory"):
		if visible == false:
			show()
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			hide()
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
