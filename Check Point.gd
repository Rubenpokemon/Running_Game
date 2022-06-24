extends Spatial


var used = "No"
var test = preload("res://Tiles/Grass_Base_Half.obj")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var spawn_brick = randi()%Global.brick_spawn_chance
	if Global.world_bricks_left[Global.active_world] >= 1:
		if spawn_brick <= 1:
			pass
		else:
			Global.brick_spawn_chance -= 1
			$"Brick Spawn Point/Brick".queue_free()
	else:
		$"Brick Spawn Point/Brick".queue_free()
	set_platform()

#func _process(delta):



func _on_CheckPoint_body_entered(body):
	if used == "No":
		if body.name == "Player":
			body.respawn_location = $CheckPoint.global_transform.origin
			body.complete_task("Levels")
			used = "Yes"
			get_parent().spawn_level()


func set_platform():
	var meshes = $Meshes.get_children()
	meshes[Global.level_type].show()
