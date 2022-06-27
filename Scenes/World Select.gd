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
		get_parent().change_screen("world_select")

	elif presses == 1:
		Select_world()


var world_number = 0

var world_names = ["Tutorial","Grasslands","Snowy Mountians", "Electric Skies", "Shaking Grounds", "All of the above"]

var world_requirments = ["None","Forge the Sword of Fire","Forge the Shurikens of Ice","Forge the Numchucks of Lightning","Forge the Scythe of Quakes","Unlock Llyod"]



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
	$"Golden Bricks Left".text = str(Global.world_bricks_left[world_number])
	if world_number > Global.worlds_unlocked:
		$"Golden Bricks Left".hide()
		$Unlock_Message.show()
		$Unlock_Message.text = str(world_requirments[world_number])
	else:
		$Unlock_Message.hide()
		$"Golden Bricks Left".show()




func Select_world():
	if Global.worlds_unlocked >= world_number:
		Global.level_type = world_number - 1 #Tutorial is number 0
		Global.active_world = world_number
		get_tree().change_scene("res://Game.tscn")


func _on_Button_pressed():
	presses = 0
	get_parent().change_screen("Menu")
