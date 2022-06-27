extends Control



func _ready():
	OS.window_fullscreen = true

	if Global.first_launch == "Yes":
		Global.first_launch = "No"
		var file = File.new()
		if file.file_exists(save_path):
			var error = file.open(save_path, File.READ)
			if error == OK:
				var player_data = file.get_var()
				file.close()
				print ("Load: ", player_data)

				Global.unlocked_skins = player_data[0]
				Global.worlds_unlocked = player_data[1]
				Global.bricks = player_data[2]
				Global.bones = player_data[3]
				Global.world_bricks_left = player_data[4]
				Global.last_used_skin = player_data[5]


var data = []
const SAVE_DIR = "user://saves/"
var save_path = SAVE_DIR + "save.dat"

func _on_Quit_pressed():
	data = [
	Global.unlocked_skins,
	Global.worlds_unlocked,
	Global.bricks,
	Global.bones,
	Global.world_bricks_left,
	Global.last_used_skin
	]
	
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir(SAVE_DIR)

	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
	print ("Save: ", data)

	get_tree().quit()


func _on_Reset_pressed():
	Global.unlocked_skins = []
	Global.worlds_unlocked = 0
	Global.bricks = 0
	Global.bones = 0
	Global.world_bricks_left = [1,5,10,25,40,100]
	Global.last_used_skin = null

func change_screen(screen):
	if screen == "world_select":
		$Start_Screen/Forge.hide()
	elif screen == "Forge":
		$Start_Screen.hide()
		$"World Select".hide()
	elif screen == "Menu":
		$Forge.hide()
		$"World Select".hide()
		$Start_Screen/Forge.show()
		$Start_Screen.show()
