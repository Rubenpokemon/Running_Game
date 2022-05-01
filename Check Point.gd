extends GridMap


var used = "No"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var spawn_brick = randi()%Global.brick_spawn_chance
	if spawn_brick <= 1:
		pass
	else:
		Global.brick_spawn_chance -= 1
		$"Brick Spawn Point/Brick".queue_free()


#func _process(delta):




func _on_CheckPoint_body_entered(body):
	if used == "No":
		if body.name == "Player":
			body.respawn_location = $CheckPoint.global_transform.origin
			used = "Yes"
			get_parent().spawn_level()


