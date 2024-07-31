extends Node

var score = 0
@onready var score_label = $ScoreLabel
@onready var Score = $"../Playerf/Panel/Score"

func add_point():
	score += 1
	score_label.text = "Great Job!You made it!You collected" + str(score) + "coins!"
	Score.text = "Score:" + str(score)
