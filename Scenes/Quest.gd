extends Control



var quest_types = ["Skeletons","Bricks","Levels"]
var quest_descriptions = ["Defeat","Collect","Finish"]
var quest_progress = [8,2,5]
#var quest_progress = [1,1,1]
var current_quest = "Skeletons"

var progress_needed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_quest()

var prev_quest = " "

func set_quest():
	var x = randi()%3
	if current_quest:
		prev_quest = current_quest
	current_quest = quest_types[x]
	progress_needed = quest_progress[x]
	
	if prev_quest == current_quest:
		print ("same quest")
		set_quest()
		return
	
	$Label.text = String(quest_descriptions[x]) + " " + String(progress_needed) + " " + String(quest_types[x])
	
	reset_ProgressBar()


func reset_ProgressBar():
	$Bar.max_value = progress_needed
	$Bar.value = 0

func add_progress():
	$Bar.value += 1
	if $Bar.value >= $Bar.max_value:
		set_quest()
