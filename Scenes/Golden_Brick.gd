extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Spin")

func _process(delta):
	rotate_y(0.05)


func _on_Area_body_entered(body):
	if body.name == "Player":
		Global.brick_spawn_chance = Global.base_brick_spawnrate
		body.add_item("Brick")
		queue_free()
