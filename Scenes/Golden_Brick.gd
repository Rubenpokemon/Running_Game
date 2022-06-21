extends MeshInstance


func _ready():
	$AnimationPlayer.play("Spin")

func _process(delta):
	rotate_y(0.05)


func _on_Area_body_entered(body):
	if body.name == "Player":
		Global.brick_spawn_chance = Global.base_brick_spawnrate
		body.add_item("Brick")
		body.complete_task("Bricks")

		Global.world_bricks_left[Global.active_world] -= 1
		if Global.world_bricks_left[Global.active_world] == 0:
			$Popup.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().paused = true
		
		else:
			queue_free()


func _on_Despawn_timeout():
	if Global.world_bricks_left[Global.active_world] == 0:
		queue_free()




func _on_Continue_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	$Popup.hide()


func _on_Main_Menu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
