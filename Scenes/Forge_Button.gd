extends TextureButton

export var skin = ""

export var bones_needed = 0
export var bricks_needed = 0
export var image = "res://icon.png"
export var description = ""

func _ready():
	texture_normal = load(image)
	$Bones.text = String(bones_needed)
	$Bricks.text = String(bricks_needed)
	$"Item Descrption".text = String(description)
