extends TextureRect

@export var FemStat: Label 
@export var MascStat: Label
@export var HornyStat: Label
@export var HeteroStat: Label
@export var HomoStat: Label

@export var MoneyStat: Label
@export var MonthlyExpensesStat: Label
@export var Day: Label
@export var WeekDay: Label
@export var TimeOfDay: Label

@export var Inventory : PanelContainer
@export var ExitInventory : Button

@export var Scrollbar: ScrollContainer
@export var Disclaimer: Label
@export var IntroOptions: Label
@export var Intro: Label

@export var Computer: Label
@export var Notepad: Label
@export var Wardrobe: Label
@export var Mirror: Label
@export var Trophycase: Label

@export var SingleBedroom: Label
@export var HouseButtons: Node2D

@export var Film: VideoStreamPlayer
@export var GenderChocie: Node2D
@export var name1: LineEdit
@export var NameConfirmation: Label
@export var DemoScene: Label

var Feminitiy = 0
var Masculinity = 0
var Hornieness = 0
var Heterosexuality = 0
var Homosexuality = 0
var money = 0
var monthlyExpenses = 950
var days = 0

var afab = false
var amab = false

signal EmailName1(name)

func _ready() -> void:
	name1.text_submitted.connect(_on_LineEdit_text)
	
#var OriginName = Name.text
	
func _on_LineEdit_text(new_text) -> void: 
	NameConfirmation.text = "Your name is:" + new_text
	
	emit_signal("EmailName1", name1.text)

func _on_of_legal_age_button_down() -> void:
	Disclaimer.visible = false
	Scrollbar.scroll_vertical = 0
	IntroOptions.visible = true

func _on_not_of_legal_age_button_down() -> void:
	Film.visible = true
	Film.play()


func _on_afab_button_down() -> void:
	GenderChocie.visible = false
	Feminitiy += 50
	afab = true
	FemStat.text = "Femininity: %0.0f" % [Feminitiy]
	MascStat.text = "Masculinity: %0.0f" % [Masculinity]

func _on_amab_button_down() -> void:
	GenderChocie.visible = false
	Masculinity += 50
	amab = true
	FemStat.text = "Femininity: %0.0f" % [Feminitiy]
	MascStat.text = "Masculinity: %0.0f" % [Masculinity]


func _on_sex_button_down() -> void:
	Heterosexuality = 0
	Homosexuality = 0
	HeteroStat.text = "Heterosexuality: %0.0f" % [Heterosexuality]
	HomoStat.text = "Homosexuality: %0.0f" % [Homosexuality]

func _on_no_sex_button_down() -> void:
	Heterosexuality = -100
	Homosexuality = -100
	HeteroStat.text = "Heterosexuality: %0.0f" % [Heterosexuality]
	HomoStat.text = "Homosexuality: %0.0f" % [Homosexuality]
	
func day_switch():
	days += 1
	Day.text = "Day %0.0f" % [days]

func week_day_switch(w):
	w += 1
	match w:
		1:
			WeekDay.text = "It's Monday"
		2:
			WeekDay.text = "It's Tuesday"
		3:
			WeekDay.text = "It's Wednesday"
		4:
			WeekDay.text = "It's Thursday"
		5:
			WeekDay.text = "It's Friday"
		6:
			WeekDay.text = "It's Saturday"
		7:
			WeekDay.text = "It's Sunday"

func time_of_day_switch(t):
	t += 1
	match t:
		1:
			TimeOfDay.text = "It's Morning"
		2:
			TimeOfDay.text = "It's Lunchtime"
		3:
			TimeOfDay.text = "It's Afternoon"
		4:
			TimeOfDay.text = "It's Dusk"
		5:
			TimeOfDay.text = "It's Nighttime"

	
func _on_to_intro_button_down() -> void:
	IntroOptions.visible = false
	Intro.visible = true
	#Intro.text = "Hello my name is" + name1.text
	day_switch()
	week_day_switch(0)
	time_of_day_switch(0)
	MoneyStat.text = "Money: %0.2f" % [money] + "$"
	MonthlyExpensesStat.text = "Monthly Expenses: %0.2f" % [monthlyExpenses] + "$"
	Scrollbar.scroll_vertical = 0

func _on_start_game_button_down() -> void:
	Intro.visible = false
	SingleBedroom.visible = true
	HouseButtons.visible = true
	Scrollbar.scroll_vertical = 0


func _on_dozing_button_down() -> void:
	if(TimeOfDay.text == "It's Morning"):
		time_of_day_switch(1)
	elif (TimeOfDay.text == "It's Lunchtime"):
		time_of_day_switch(2)
	elif(TimeOfDay.text == "It's Afternoon"):
		time_of_day_switch(3)
	elif(TimeOfDay.text == "It's Dusk"):
		time_of_day_switch(4)
	elif(TimeOfDay.text == TimeOfDay.text):
		time_of_day_switch(0)
		if(WeekDay.text == "It's Monday"):
			week_day_switch(1)
		elif(WeekDay.text == "It's Tuesday"):
			week_day_switch(2)	
		elif(WeekDay.text == "It's Wednesday"):
			week_day_switch(3)	
		elif(WeekDay.text == "It's Thursday"):
			week_day_switch(4)	
		elif(WeekDay.text == "It's Friday"):
			week_day_switch(5)	
		elif(WeekDay.text == "It's Saturday"):
			week_day_switch(6)
		elif(WeekDay.text == "It's Sunday"):
			week_day_switch(0)	

		day_switch()
	print(TimeOfDay.text)


func _on_inventory_button_down() -> void:
	Inventory.visible = true
	ExitInventory.visible = true
	Scrollbar.scroll_vertical = 0

func _on_exit_inventory_button_down() -> void:
	Inventory.visible = false
	ExitInventory.visible = false
	Scrollbar.scroll_vertical = 0
