extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d = $Sprite2D
@onready var jump_sound = $Jump
@onready var die_sound = $"../die"
@onready var pnc_sound = $"../pnc"
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"
		

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft


func _on_area_2d_body_entered(body):
	if body.name == "CharacterBody2D":
		%CharacterBody2D.set_global_position(Vector2(80, 100))
		die_sound.play()


func _on_npc_body_entered(body):
	if body.name == "CharacterBody2D":
		$"../npc/npc/TextureRect".visible = true
		$Camera2D/start.visible = true
		pnc_sound.play()


func _on_npc_body_exited(body):
	if body.name == "CharacterBody2D":
		$"../npc/npc/TextureRect".visible = false
		

func _on_meme_1_pressed():
	$Camera2D/meme_img1.visible = true

func _on_meme_2_pressed():
	$Camera2D/meme_img2.visible = true

func _on_meme_3_pressed():
	$Camera2D/meme_img3.visible = true

func _on_meme_4_pressed():
	$Camera2D/meme_img4.visible = true


func _on_npc_2_body_entered(body):
	if body.name == "CharacterBody2D":
		$"../npc2/npc2/TextureRect".visible = true
		$Camera2D/npc2.visible =  true
		pnc_sound.play()


func _on_npc_2_body_exited(body):
	if body.name == "CharacterBody2D":
		$"../npc2/npc2/TextureRect".visible = false


func _on_npc_3_body_entered(body):
	if body.name == "CharacterBody2D":
		$"../npc3/npc3/TextureRect".visible = true
		$Camera2D/npc3.visible =  true
		pnc_sound.play()
		


func _on_npc_3_body_exited(body):
	if body.name == "CharacterBody2D":
		$"../npc3/npc3/TextureRect".visible = false


func _on_npc_4_body_entered(body):
	if body.name == "CharacterBody2D":
		$"../npc4/npc4/TextureRect".visible = true
		$Camera2D/npc4.visible =  true
		pnc_sound.play()
		


func _on_npc_4_body_exited(body):
	if body.name == "CharacterBody2D":
		$"../npc4/npc4/TextureRect".visible = false


func _on_npc_5_body_entered(body):
	if body.name == "CharacterBody2D":
		$"../npc5/npc5/TextureRect".visible = true
		$Camera2D/npc5.visible =  true
		pnc_sound.play()
		


func _on_npc_5_body_exited(body):
	if body.name == "CharacterBody2D":
		$"../npc5/npc5/TextureRect".visible = false



func _on_npc_6_body_entered(body):
	if body.name == "CharacterBody2D":
		$"../npc6/npc6/TextureRect".visible = true
		$Camera2D/npc6.visible =  true
		pnc_sound.play()
		


func _on_npc_6_body_exited(body):
	if body.name == "CharacterBody2D":
		$"../npc6/npc6/TextureRect".visible = false



func _on_npc_7_body_entered(body):
	if body.name == "CharacterBody2D":
		$"../npc7/npc7/TextureRect".visible = true
		$Camera2D/npc7.visible =  true
		pnc_sound.play()
		

func _on_npc_7_body_exited(body):
	if body.name == "CharacterBody2D":
		$"../npc7/npc7/TextureRect".visible = false



func _on_npc_8_body_entered(body):
	if body.name == "CharacterBody2D":
		$"../npc8/npc8/TextureRect".visible = true
		$Camera2D/npc8.visible =  true
		pnc_sound.play()
		

func _on_npc_8_body_exited(body):
	if body.name == "CharacterBody2D":
		$"../npc8/npc8/TextureRect".visible = false
		


func _on_rainbow_body_entered(body):
	if body.name == "CharacterBody2D":
		get_tree().change_scene_to_file("res://end_menu.tscn")



