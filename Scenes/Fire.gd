extends Spatial


var player

var bolts = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in $Lightning_Bolts.get_children():
		i.hide()
		bolts.append(i)
	bolt_animation()


func bolt_animation():
	bolts.shuffle()
	var x = rand_range(2,5)
	for i in x:
		var bolt = bolts[i]
		bolt.show()
		$Animation_Timer.start()


func _on_Area_body_entered(body):
	if body.name == "Player":
		player = body
		#if body.attacking == "No":
		$"Jump Delay".start()
		#else:
		#	hide()
		#	$"Hide Delay".start()


func _on_Jump_Delay_timeout():
	player.jump()


func _on_Hide_Delay_timeout():
	show()


func _on_Animation_Timer_timeout():
	for i in $Lightning_Bolts.get_children():
		i.hide()
		bolts.append(i)
	bolt_animation()
