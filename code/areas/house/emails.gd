extends Label

var name1 = ""

@export var email_title1 : Label
@export var email_title2 : Label
#@export var Email_title3 : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_email_name_1(name: Variant) -> void:
	name1 += name
	#print(name1 + " is my name")
	email_title1.text = "From: WeedForLive \nTo: " + name1
	email_title2.text = "From: DildoFactory \nTo: " + name1	
