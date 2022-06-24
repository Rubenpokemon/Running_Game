extends Spatial


var hats = []

func _ready():
	hats = get_children()

func change_hair(skin_name):
	print ("Change Hair: ", skin_name)
	for i in hats:
		if i.name == skin_name:
			i.show()
		else:
			i.hide()
