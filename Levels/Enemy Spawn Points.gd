extends Spatial

var enemy = preload("res://Scenes/Enemy.tscn")
var powerup = preload("res://Scenes/PowerUp.tscn")

export var enemies_to_spawn = 2

var spawn_points = []

func _ready():

	if get_child_count() >= 1:

		spawn_points = get_children()
		randomize()
		
		for i in enemies_to_spawn:
			spawn_points.shuffle()
			var chosen_point = spawn_points.front()
			spawn_points.erase(chosen_point)
			var x = randi()%2
			if x != 1: #Spawn Enemy
				var enemy_spawn = enemy.instance()
				enemy_spawn.translation = Vector3.ZERO
				chosen_point.add_child(enemy_spawn)
			elif x == 1: #Spawn PowerUp
				var powerup_spawn = powerup.instance()
				powerup_spawn.translation = Vector3.ZERO
				chosen_point.add_child(powerup_spawn)
