extends Spatial

var mat
var chest_color = Color.white

func _ready():
	randomize()
	$AnimationPlayer.play("Running")
	$AnimationPlayer.playback_speed = 2
	load_last_used_skin()
#	mat = $Head.get_surface_material(0)
	#set_character(Color(0.05,0.4,0.09),"Llyod","res://Materials/LLyod_Chest_Front.jpg")



func load_last_used_skin():
	if Global.last_used_skin:
		set_character(Global.last_used_skin[0],Global.last_used_skin[1],Global.last_used_skin[2])
		get_parent().set_tornado_color(Global.last_used_skin[0])


var character_colors = [Color.red,Color.white,Color(0,0.4,1),Color.black,Color(0.05,0.4,0.09)]

#Premade Characters
func set_character(color,skin_name,shirt):
	chest_color = color
	var hood_mat = $Head.get_surface_material(0)
	hood_mat.albedo_color = color
	var sleeve_mat = $Left_Arm.get_surface_material(0)
	sleeve_mat.albedo_color = color
	var pants_mat = $legomantrusi/legomanpolySurface23/Groin.get_surface_material(0)
	pants_mat.albedo_color = color
	var chest_mat = $legomanpCylinder2/legomanpolySurface5/Chest.get_surface_material(0)
	chest_mat.albedo_texture = load(shirt)
	chest_mat.albedo_color = Color.white
	change_hair(skin_name)
	Global.last_used_skin = [color,skin_name,shirt]

func change_shirt(shirt,match_color):
	var shirt_mat = $legomanpCylinder2/legomanpolySurface5/Chest.get_surface_material(0)
	if match_color == "Yes":
		#shirt_mat.albedo_color = chest_color
		pass
	shirt_mat.albedo_texture = load(shirt)

func change_hair(skin_name):
	$Head2.change_hair(skin_name)

var material

func change_part_color(color,part):
	if part == "Sleeves":
		material = $Left_Arm.get_surface_material(0)
	elif part == "Chest":
		material = $legomanpCylinder2/legomanpolySurface5/Chest.get_surface_material(0)
	elif part == "Pants":
		material = $legomantrusi/legomanpolySurface23/Groin.get_surface_material(0)
	elif part == "Head":
		material = $Head.get_surface_material(0)
	elif part == "Hands":
		material = $Right_Hand.get_surface_material(0)

	material.albedo_color = color
	print (part)
