extends GridMap


var used = "No"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CheckPoint_body_entered(body):
	if used == "No":
		if body.name == "Player":
			body.respawn_location = $CheckPoint.global_transform.origin
			used = "Yes"
			get_parent().spawn_level()


