extends TextureRect

@export var Disclaimer: Label
@export var TestDemo: Label
@export var Film: VideoStreamPlayer

func _on_next_slide_button_down() -> void:
	pass # Replace with function body.

func _on_of_legal_age_button_down() -> void:
	Disclaimer.visible = false
	TestDemo.visible = true

func _on_not_of_legal_age_button_down() -> void:
	Film.visible = true
	Film.play()
