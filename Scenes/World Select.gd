extends Control


var presses = 0
var can_play_level


func _ready():
	get_tree().paused = false

func _on_Play_pressed():
	if presses == 0:
		show()
		presses += 1
		World_Select_Update()

	elif presses == 1:
		Select_world()


var world_number = 0

var world_names = ["Tutorial","Grasslands","Snowy Mountians", "Electric Skies", "Shaking Grounds", "All of the above"]

var world_requirments = ["None","Complete The Tutorial","Forge the Sword of Fire","Forge the Shurikens of Ice","Forge the Numchucks of Lightning","Forge the Scythe of Quakes"]



func World_Select_Down():
	if world_number != 0:
		world_number -= 1
		World_Select_Update()


func World_Select_Up():
	if world_number != 5:
		world_number += 1
		World_Select_Update()



func World_Select_Update():
	$Sprite.frame = world_number
	$Area_Name.text = str(world_names[world_number])




func Select_world():
	if Global.worlds_unlocked >= world_number:
		Global.level_type = world_number - 1 #Tutorial is number 0
		Global.active_world = world_number
		get_tree().change_scene("res://Game.tscn")
