extends GridContainer

@export var Camera : Label
var CameraNumber = 0
signal Cameras(value)
func _on_test_camera_button_button_down() -> void:
	if(CameraNumber <= 0):
		CameraNumber += 1
		Cameras.emit(1)
	Camera.text = "Camera: %0.0f" % [CameraNumber] + "x"
