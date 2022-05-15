extends Control



var quest_types = ["Skeletons","Bricks","Levels"]
var quest_descriptions = ["Defeat","Collect","Finish"]
var quest_progress = [10,2,5]

var current_quest = "Skeletons"

var progress_needed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_quest()


func set_quest():
	var x = randi()%3
	current_quest = quest_types[x]
	progress_needed = quest_progress[x]
	
	$Label.text = String(quest_descriptions[x]) + " " + String(progress_needed) + " " + String(quest_types[x])
	
	reset_ProgressBar()


func reset_ProgressBar():
	$Bar.max_value = progress_needed
	$Bar.value = 0

func add_progress():
	print ("Add Progress To Quest")
	$Bar.value += 1
	if $Bar.value >= $Bar.max_value:
		set_quest()
