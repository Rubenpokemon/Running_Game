extends Spatial


var falling

func fall():
	falling = 1
	$Timer.start()

func _process(delta):
	if falling:
		translation.y -= 20 * delta


func _on_Timer_timeout():
	queue_free()
