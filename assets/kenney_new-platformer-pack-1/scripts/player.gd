extends CharacterBody2D # This line tells Godot that this script is connected to the CharacterBody2D node

# This line is a comment that will never affect the course of this code/program at all, so no need to worry about it.
const SPEED = 200.0 # This line declares a variable called SPEED and sets its value to 200. const means the value doesn't change in the game, you can't increment or decrement it. SPEED is how fast the player goes.
const JUMP_VELOCITY = -580.0 # This line declares a variable called JUMP_VELOCITY and sets its value to -470. You know what const means now, so JUMP_VELOCITY is the jump height. In Godot, negative numbers go up and 0 is the top of the screen.

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
 
@onready var animated_sprite = $AnimatedSprite2D # @onready marks the following property as assigned when the Node is ready. Values for these properties are not assigned immediately when the node is initialized (Object._init()), and instead are computed and stored right before Node._ready(). var declares a variable called animated_sprite and makes it equal to the node Animated Sprite 2D. The node is activated by putting a $ symbol behind it.

# the physics_process function runs many many times every second and delta is the time since the last frame, it helps keep the animation smooth
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction: -1, 0, 1,
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide() # This is the final important function which applies all of this to the player!!
	
func die():
	var game_manager = get_tree().get_root().get_node("Game/GameManager")
	game_manager.show_lose_screen()

# NOTE: Commented lines don't affect this code at all, they won't even be executed.
