extends Node

var score = 0
@onready var score_label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "Great Job!You made it!You collected" + str(score) + "coins!"
