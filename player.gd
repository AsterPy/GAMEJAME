extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d = $Sprite2D
@onready var jump_sound = $Jump
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


func _on_npc_body_entered(body):
	if body.name == "CharacterBody2D":
		$"../npc/npc/TextureRect".visible = true
		$Camera2D/start.visible = true
		$Camera2D/startBlock.visible = false


func _on_npc_body_exited(body):
	if body.name == "CharacterBody2D":
		$"../npc/npc/TextureRect".visible = false

func _on_cloud1_pressed():
	$Camera2D/cloud1.visible = true
	$"../Timer".start() 

func _on_timer_timeout():
	$Camera2D/cloud1.visible = false

