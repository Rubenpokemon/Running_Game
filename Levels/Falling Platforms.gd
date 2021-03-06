extends Spatial

var used = "No"
var platforms = []
var falling_platform

var speed = 10

func _ready():
	randomize()
	platforms = $Platforms.get_children()


func _process(_delta):
	if falling_platform:
		pass


func _on_Area_body_entered(body):
	if body.name == "Player" and used == "No":
		used = "Yes"
		platforms.shuffle()
		falling_platform = platforms[0]
		falling_platform.fall()

	if get_child_count() == 3:
		$Fall.fall()
