extends Spatial


var player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	if body.name == "Player":
		player = body
		if body.attacking == "No":
			$"Jump Delay".start()
		else:
			hide()
			$"Hide Delay".start()


func _on_Jump_Delay_timeout():
	player.jump()


func _on_Hide_Delay_timeout():
	show()
