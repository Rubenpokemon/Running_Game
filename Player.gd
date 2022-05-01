extends KinematicBody

var respawn_location = Vector3.ZERO

var speed_bonus = 2

var jump_force = 0.5 #* speed_bonus
var speed = 0.5 * speed_bonus
var velocity = Vector3.ZERO #(0.0.0)

var attacking = "No"

var gravity_limit = 0.2 
var gravity = 0.1 * speed_bonus

var player_model
var anim

func _ready():
	velocity.x = speed # * speed_bonus
	player_model = $Player_Model
	anim = $Player_Model/AnimationPlayer


func _input(event):
	if event.is_action_pressed("Left"):
		velocity.z = (-speed * 0.75) 
	if event.is_action_released("Left"):
		velocity.z = 0
		check_L_R()

	if event.is_action_pressed("Right"):
		velocity.z = (speed * 0.75) 
	if event.is_action_released("Right"):
		velocity.z = 0
		check_L_R()

	if event.is_action_pressed("Jump") and $Feet.get_overlapping_bodies().size() != 0:
		gravity = gravity - jump_force
		#anim.playback_speed = 0.5
		anim.play("Jump")
		if not player_model.is_visible_in_tree():
			$Tornado.hide()
			player_model.show()
			attacking = "No"


	if event.is_action_pressed("Down"):
		player_model.hide()
		$Tornado.show()
		attacking = "Yes"


func check_L_R():
	if Input.is_action_pressed("Left"):
		velocity.z = (-speed * 0.75) 
	elif Input.is_action_pressed("Right"):
		velocity.z = (speed * 0.75) 

	elif not Input.is_action_pressed("Right") or Input.is_action_pressed("Left"):
		velocity.z = 0


func _process(delta):
	movement(delta)
	change_rotation()

func movement(delta):
	move_and_collide(velocity)

	if not anim.is_playing():
		#anim.playback_speed = 2
		anim.play("Running")


	if not is_on_floor():
		translation.y -= gravity# * speed_bonus
		if gravity < gravity_limit:
			gravity = gravity + gravity_limit/(18 / speed_bonus)

	if translation.y <= 0:
		respawn()



	if attacking == "Yes":
		$Tornado.rotation_degrees.y += 10


func change_rotation():
	if velocity.z == 0 :
		player_model.rotation_degrees.y = -180
	elif velocity.z == speed * 0.75:
		player_model.rotation_degrees.y = 165
	elif velocity.z == -speed * 0.75:
		player_model.rotation_degrees.y = -165

func respawn():
	print("Respawn")
	translation = respawn_location

func change_skin(color,skin_name,shirt):
	$Player_Model.set_character(color,skin_name,shirt)
	set_tornado_color(color)

func change_shirt(shirt,match_color):
	$Player_Model.change_shirt(shirt,match_color)

func change_part_color(color,part):
	if not part == "Tornado":
		$Player_Model.change_part_color(color,part)
	else:
		set_tornado_color(color)

func set_tornado_color(color):
	var mat = $Tornado.get_surface_material(0)
	mat.albedo_color = color
	if mat.albedo_color == Color.black:
		mat.albedo_color = Color(0.5,0.25,0)
