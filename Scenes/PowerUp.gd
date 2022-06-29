extends Spatial



var types = ["Brick","Bones","Level"]



func _on_Area_body_entered(body):
	if body.name == "Player":
		print ("Collect PowerUp")
		body.start_airjitzu()
		queue_free()
