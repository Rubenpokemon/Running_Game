extends Area



func _on_Enemy_body_entered(body):
	if body.name == "Player":
		if body.attacking == "No":
			print("Death")
		elif body.attacking == "Yes":
			queue_free()
			body.add_item("Bone")
			
