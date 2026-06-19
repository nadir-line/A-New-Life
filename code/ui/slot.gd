extends TextureRect

@onready var icon = $icon
@onready var quantity = $quantity

func _get_drag_data(at_position: Vector2) -> Variant:
	
	var preview = Control.new()
	var picon = TextureRect.new()
	picon.position -= Vector2(32, 32)
	picon.texture = icon.texture
	preview.add_child(picon)
	set_drag_preview(preview)
	modulate = Color(1, 1, 1, 0.5)
	var data = {}
	return data

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func  _drop_data(at_position: Vector2, data: Variant) -> void:
	pass

func _notification(what: int) -> void:
	if what == NOTIFICATION_DRAG_END:
		modulate = Color(1, 1, 1, 1)
