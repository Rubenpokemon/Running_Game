extends Control


func _ready():
	for button in $Buttons.get_children():
		button.connect("pressed", self, "forge_item", [button.bricks_needed,button.bones_needed,button.skin])


func _on_Forge_pressed():
	show()
	get_parent().change_screen("Forge")
	update_item_counter()


func _on_Menu_pressed():
	get_parent().change_screen("Menu")


func forge_item(bricks_needed,bones_needed,skin_name):
	if skin_name and Global.bricks >= bricks_needed and Global.bones >= bones_needed:
		Global.bricks -= bricks_needed
		Global.bones -= bones_needed
		update_item_counter()
		Global.unlocked_skins.append(skin_name)
		Global.worlds_unlocked += 1
		for button in $Buttons.get_children():
			if button.name == skin_name:
				button.disable_button()

func update_item_counter():
	$Bone_Count.text = str(Global.bones)
	$Brick_Count.text = str(Global.bricks)
