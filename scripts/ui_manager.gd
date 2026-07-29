class_name Ui_manager

extends CanvasLayer
var score = 0
@onready var scorelabel: Label = $scorelabel


func _ready() -> void:
	scorelabel.text = "Score : "+str(score)
	
func add_point():
	score+=1
	print(scorelabel)
	scorelabel.text = "Score : "+str(score)
