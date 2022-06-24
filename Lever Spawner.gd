extends Spatial

var levels_done = -1 #Goes to 0 when the first level spawns in

var checkpoint = preload("res://Levels/Check Point.tscn")

var grass_levels = [preload("res://Levels/Grass_Level_1.tscn"),preload("res://Levels/Grass_Level_2.tscn"),preload("res://Levels/Grass_Level_3.tscn"),preload("res://Levels/Grass_Level_4.tscn"),preload("res://Levels/Grass_Level_5.tscn"),preload("res://Levels/Grass_Level_6.tscn")]
var snow_levels = [preload("res://Levels/Snow_Level_1.tscn"),preload("res://Levels/Snow_Level_2.tscn")]
var cloud_levels = [preload("res://Levels/Cloud_Level_1.tscn"),preload("res://Levels/Cloud_Level_2.tscn")]


var level_types = [grass_levels,snow_levels,cloud_levels]
var levels_to_spawn = []
var level_pack 
var loaded_levels = []


func _ready():
	randomize()
	#spawn_level()
	level_pack = level_types[Global.level_type]
	Global.map_length = 0
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func spawn_checkpoint():
	var checkpointspawn = checkpoint.instance()
	Global.map_length += 4
	checkpointspawn.translation.x = Global.map_length * 11.5
	add_child(checkpointspawn)


func spawn_level():

	if levels_to_spawn.size() == 0:
		levels_to_spawn.append_array(level_pack)
		#levels_to_spawn.append_array(cloud_levels)
		levels_to_spawn.shuffle()


	if levels_to_spawn.size() >= 1:
		levels_to_spawn.shuffle()
		var x = levels_to_spawn.front()
		#var x = preload("res://Levels/Snow_Level_1.tscn")
		levels_to_spawn.erase(x) 
		var spawninglevel = x.instance()
		spawninglevel.translation.x = Global.map_length * 11.5
		add_child(spawninglevel)
		spawn_checkpoint()

		loaded_levels.append(spawninglevel)
		levels_done += 1

		if levels_done >= 1:
			var deleting_level = loaded_levels.front()
			deleting_level.queue_free()
			loaded_levels.erase(deleting_level)

