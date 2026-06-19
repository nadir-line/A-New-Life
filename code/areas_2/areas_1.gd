extends Node2D

@export var scrollbar: ScrollContainer

@export var singleBedroom: Label
@export var streaming: Label
@export var email: Label


@export var bathroom: Label
@export var kitchen: Label
@export var livingRoom: Label
@export var foyer: Label

@export var houseButtons: Label
#BedroomButtons
@export var computer: Label
@export var notepad: Label
@export var wardrobe: Label
@export var mirror: Label
@export var trophycase: Label

#@export var Inventory: GridContainer
var CameraNumber = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#Roons in House-----------------

func _on_bathroom_button_down() -> void:
	singleBedroom.visible = false
	bathroom.visible = true
	kitchen.visible = false
	livingRoom.visible = false
	foyer.visible = false
	scrollbar.scroll_vertical = 0


func _on_kitchen_button_down() -> void:
	singleBedroom.visible = false
	bathroom.visible = false
	kitchen.visible = true
	livingRoom.visible = false
	foyer.visible = false
	scrollbar.scroll_vertical = 0

func _on_living_room_button_down() -> void:
	singleBedroom.visible = false
	bathroom.visible = false
	kitchen.visible = false
	livingRoom.visible = true
	foyer.visible = false
	scrollbar.scroll_vertical = 0

func _on_foyer_button_down() -> void:
	singleBedroom.visible = false
	bathroom.visible = false
	kitchen.visible = false
	livingRoom.visible = false
	foyer.visible = true
	scrollbar.scroll_vertical = 0

func _on_single_bedroom_button_down() -> void:
	singleBedroom.visible = true
	bathroom.visible = false
	kitchen.visible = false
	livingRoom.visible = false
	foyer.visible = false
	scrollbar.scroll_vertical = 0

#Areas in the Bedroom------------------
	notepad 
	wardrobe
	mirror
	trophycase


func _on_computer_button_down() -> void:
	computer.visible = true
	singleBedroom.visible = false
	houseButtons.visible = false
	scrollbar.scroll_vertical = 0


func _on_notepad_button_down() -> void:
	notepad.visible = true
	singleBedroom.visible = false
	houseButtons.visible = false
	scrollbar.scroll_vertical = 0


func _on_wardrobe_button_down() -> void:
	wardrobe.visible = true
	singleBedroom.visible = false
	houseButtons.visible = false
	scrollbar.scroll_vertical = 0


func _on_mirror_button_down() -> void:
	mirror.visible = true
	singleBedroom.visible = false
	houseButtons.visible = false
	scrollbar.scroll_vertical = 0


func _on_trophycase_button_down() -> void:
	trophycase.visible = true
	singleBedroom.visible = false
	houseButtons.visible = false
	scrollbar.scroll_vertical = 0

func _on_my_inventory_cameras(value: Variant) -> void:
	CameraNumber += value
	print(CameraNumber)
func _on_stream_button_down() -> void:
	if (CameraNumber >= 1):
		streaming.visible = true
		computer.visible = false
		scrollbar.scroll_vertical = 0

	else:
		streaming.visible = false
		computer.visible = true


	
	


func _on_video_games_button_down() -> void:
	pass # Replace with function body.


func _on_emails_button_down() -> void:
	email.visible = true
	computer.visible = false
	scrollbar.scroll_vertical = 0
