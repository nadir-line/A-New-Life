extends TextureRect

@export var hetero_stat: Label
@export var homo_stat: Label
@export var horny_stat: Label
@export var fem_stat: Label 
@export var masc_stat: Label

@export var money_stat: Label
@export var monthly_expenses_stat: Label
@export var day: Label
@export var week_day: Label
@export var time_of_day: Label

@export var inventory : PanelContainer
@export var exit_inventory : Button

@export var scrollbar: ScrollContainer
@export var disclaimer: Label
@export var intro_options: Label
@export var intro: Label

@export var single_bedroom: Label
@export var house_buttons: Label

@export var rick_roll: VideoStreamPlayer
@export var gender_choice: Node2D
@export var name1: LineEdit
@export var name_confirmation: Label
@export var demo_scene: Label

var feminitiy = 0
var masculinity = 0
var hornieness = 0
var heterosexuality = 0
var homosexuality = 0
var money = 0
var monthly_expenses = 950
var days = 0

var afab = false
var amab = false

signal EmailName1(name)

func _ready() -> void:
	name1.text_submitted.connect(_on_LineEdit_text)
	
#var OriginName = Name.text
	
func _on_LineEdit_text(new_text) -> void: 
	name_confirmation.text = "Your name is:" + new_text
	
	emit_signal("EmailName1", name1.text)

func _on_of_legal_age_button_down() -> void:
	disclaimer.visible = false
	scrollbar.scroll_vertical = 0
	intro_options.visible = true

func _on_not_of_legal_age_button_down() -> void:
	rick_roll.visible = true
	rick_roll.play()


func _on_afab_button_down() -> void:
	gender_choice.visible = false
	feminitiy += 50
	afab = true
	fem_stat.text = "Femininity: %0.0f" % [feminitiy]
	masc_stat.text = "Masculinity: %0.0f" % [masculinity]

func _on_amab_button_down() -> void:
	gender_choice.visible = false
	masculinity += 50
	amab = true
	fem_stat.text = "Femininity: %0.0f" % [feminitiy]
	masc_stat.text = "Masculinity: %0.0f" % [masculinity]


func _on_sex_button_down() -> void:
	heterosexuality = 0
	homosexuality = 0
	hetero_stat.text = "Heterosexuality: %0.0f" % [heterosexuality]
	homo_stat.text = "Homosexuality: %0.0f" % [homosexuality]

func _on_no_sex_button_down() -> void:
	heterosexuality = -100
	homosexuality = -100
	hetero_stat.text = "Heterosexuality: %0.0f" % [heterosexuality]
	homo_stat.text = "Homosexuality: %0.0f" % [homosexuality]
	
func day_switch():
	days += 1
	day.text = "Day %0.0f" % [days]

func week_day_switch(w):
	w += 1
	match w:
		1:
			week_day.text = "It's Monday"
		2:
			week_day.text = "It's Tuesday"
		3:
			week_day.text = "It's Wednesday"
		4:
			week_day.text = "It's Thursday"
		5:
			week_day.text = "It's Friday"
		6:
			week_day.text = "It's Saturday"
		7:
			week_day.text = "It's Sunday"

func time_of_day_switch(t):
	t += 1
	match t:
		1:
			time_of_day.text = "It's Morning"
		2:
			time_of_day.text = "It's Lunchtime"
		3:
			time_of_day.text = "It's Afternoon"
		4:
			time_of_day.text = "It's Dusk"
		5:
			time_of_day.text = "It's Nighttime"

	
func _on_to_intro_button_down() -> void:
	intro_options.visible = false
	intro.visible = true
	#Intro.text = "Hello my name is" + name1.text
	day_switch()
	week_day_switch(0)
	time_of_day_switch(0)
	money_stat.text = "Money: %0.2f" % [money] + "$"
	monthly_expenses_stat.text = "Monthly Expenses: %0.2f" % [monthly_expenses] + "$"
	scrollbar.scroll_vertical = 0

func _on_start_game_button_down() -> void:
	intro.visible = false
	single_bedroom.visible = true
	house_buttons.visible = true
	scrollbar.scroll_vertical = 0


func _on_dozing_button_down() -> void:
	if(time_of_day.text == "It's Morning"):
		time_of_day_switch(1)
	elif (time_of_day.text == "It's Lunchtime"):
		time_of_day_switch(2)
	elif(time_of_day.text == "It's Afternoon"):
		time_of_day_switch(3)
	elif(time_of_day.text == "It's Dusk"):
		time_of_day_switch(4)
	elif(time_of_day.text == "It's Nighttime"):
		time_of_day_switch(0)
		if(week_day.text == "It's Monday"):
			week_day_switch(1)
		elif(week_day.text == "It's Tuesday"):
			week_day_switch(2)	
		elif(week_day.text == "It's Wednesday"):
			week_day_switch(3)	
		elif(week_day.text == "It's Thursday"):
			week_day_switch(4)	
		elif(week_day.text == "It's Friday"):
			week_day_switch(5)	
		elif(week_day.text == "It's Saturday"):
			week_day_switch(6)
		elif(week_day.text == "It's Sunday"):
			week_day_switch(0)	

		day_switch()
	print(time_of_day.text)


func _on_inventory_button_down() -> void:
	inventory.visible = true
	exit_inventory.visible = true
	scrollbar.scroll_vertical = 0

func _on_exit_inventory_button_down() -> void:
	inventory.visible = false
	exit_inventory.visible = false
	scrollbar.scroll_vertical = 0
