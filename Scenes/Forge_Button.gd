extends TextureButton

export var skin = ""

export var bones_needed = 0
export var bricks_needed = 0
export var image = "res://icon.png"
export var description = ""

func _ready():
	$TextureRect3.texture = load(image)
	$Bones.text = String(bones_needed)
	$Bricks.text = String(bricks_needed)
	$"Item Descrption".text = String(description)

	if Global.unlocked_skins.has(skin):
		disable_button()

func disable_button():
	disabled = true
	for i in get_children():
		i.hide()
		$TextureRect3.show()
