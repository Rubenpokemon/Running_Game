extends Node

var first_launch = "Yes"
var last_used_skin


var worlds_unlocked = 0
var level_type

var unlocked_skins = ["Llyod"]

var map_length = 0


var active_world
var world_bricks_left = [1,5,10,25,40,100]


var player_color = Color.white
# Color.red = Kai, Color(0.05,0.4,0.09) = Llyod, Color(0,0.4,1) = Jay, Color.white = Zane, Color.black = Cole

var custom_shirt = "No"


var base_brick_spawnrate = 10
var brick_spawn_chance = base_brick_spawnrate

var bricks= 0
var bones = 0

var speed_boost = 2
