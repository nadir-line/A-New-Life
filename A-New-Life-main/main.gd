extends Sprite2D



func _on_left_ui_bar_toggle_button_down() -> void:
	$LeftUIBarToggle.visible = false
	$UIBarLeft.visible = true 


func _on_right_ui_bar_toggle_button_down() -> void:
	$RightUIBarToggle.visible = false
	$UIBarRight.visible = true 
