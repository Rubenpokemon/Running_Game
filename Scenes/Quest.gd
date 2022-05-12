extends Control


var quest_types = ["Skeletons","Bricks","Levels"]


var current_quest = "Skeletons"

var progress_needed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_ProgressBar()


func reset_ProgressBar():
	$Bar.max_value = progress_needed
	$Bar.value = 0

func add_progress():
	print ("Add Progress To Quest")
	$Bar.value += 1
	if $Bar.value >= $Bar.max_value:
		print ("Finish Quest")
