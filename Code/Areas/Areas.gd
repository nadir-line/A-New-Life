extends Node2D

@export var Scrollbar: ScrollContainer

@export var SingleBedroom: Label
@export var Bathroom: Label
@export var Kitchen: Label
@export var LivingRoom: Label
@export var Foyer: Label

@export var Computer: Label
@export var Notepad: Label
@export var Wardrobe: Label
@export var Mirror: Label
@export var Trophycase: Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_bathroom_button_down() -> void:
	SingleBedroom.visible = false
	Bathroom.visible = true
	Kitchen.visible = false
	LivingRoom.visible = false
	Foyer.visible = false
	Scrollbar.scroll_vertical = 0


func _on_kitchen_button_down() -> void:
	SingleBedroom.visible = false
	Bathroom.visible = false
	Kitchen.visible = true
	LivingRoom.visible = false
	Foyer.visible = false
	Scrollbar.scroll_vertical = 0

func _on_living_room_button_down() -> void:
	SingleBedroom.visible = false
	Bathroom.visible = false
	Kitchen.visible = false
	LivingRoom.visible = true
	Foyer.visible = false
	Scrollbar.scroll_vertical = 0

func _on_foyer_button_down() -> void:
	SingleBedroom.visible = false
	Bathroom.visible = false
	Kitchen.visible = false
	LivingRoom.visible = false
	Foyer.visible = true
	Scrollbar.scroll_vertical = 0

func _on_single_bedroom_button_down() -> void:
	SingleBedroom.visible = true
	Bathroom.visible = false
	Kitchen.visible = false
	LivingRoom.visible = false
	Foyer.visible = false
	Scrollbar.scroll_vertical = 0
