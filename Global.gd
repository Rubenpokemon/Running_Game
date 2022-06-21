extends Node

var worlds_unlocked = 2
var level_type

var map_length = 0


var active_world
var world_bricks_left = [1,5,10,25,40,100]


var player_color = Color.white
# Color.red = Kai, Color(0.05,0.4,0.09) = Llyod, Color(0,0.4,1) = Jay, Color.white = Zane, Color.black = Cole

var custom_shirt = "No"


var base_brick_spawnrate = 1 #5
var brick_spawn_chance = 1 #5
var bricks = 0
