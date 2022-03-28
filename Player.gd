extends KinematicBody

var jump_force = 0.5
var speed = 0.5
var velocity = Vector3.ZERO #(0.0.0)



var gravity_limit = 0.2
var gravity = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = speed

func _input(event):
	if event.is_action_pressed("Left"):
		velocity.z = -speed * 0.75
	if event.is_action_released("Left"):
		velocity.z = 0
		check_L_R()

	if event.is_action_pressed("Right"):
		velocity.z = speed * 0.75
	if event.is_action_released("Right"):
		velocity.z = 0
		check_L_R()

	if event.is_action_pressed("Jump") and $Feet.get_overlapping_bodies().size() != 0:
		gravity = gravity - jump_force



func check_L_R():
	if Input.is_action_pressed("Left"):
		velocity.z = -speed * 0.75
	if Input.is_action_pressed("Right"):
		velocity.z = speed * 0.75

func _process(delta):
	movement(delta)
	change_rotation()

func movement(delta):
	move_and_collide(velocity)
	if not is_on_floor():
		translation.y -= gravity
		if gravity < gravity_limit:
			gravity = gravity + gravity_limit/18

	if Input.is_action_pressed("Down"):
		print ("Spinjitzu")



func _on_Respawn_body_entered(body):
	if body.name == "Player":
		print ("Fell out of map")
		get_tree().reload_current_scene()

func change_rotation():
	if velocity.z == 0 :
		$Ninjago.rotation_degrees.y = -180
	elif velocity.z == speed * 0.75:
		$Ninjago.rotation_degrees.y = 165
	elif velocity.z == -speed * 0.75:
		$Ninjago.rotation_degrees.y = -165
