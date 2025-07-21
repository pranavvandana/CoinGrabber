extends Node2D # This line tells Godot that this script is connected to the Node2D Class

const SPEED = 60 # This line declares the variable SPEED and sets its value to 60, and used const, meaning the value of SPEED can't change at all

var direction = 1 # the directions is set to 1

# the 3 lines use @onready, a specific class explained int he player script and sets each variable set to a specific node using the $ symbol
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction -= 1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	position.x += direction * SPEED * delta

# This function makes sure the screen switches to the losing scene once the player entered the killzone
func _on_body_entered(body):
	if body.is_in_group("player"):
		body.queue_free()
		get_tree().call_deferred("change_scene_to_file", "res://scenes/losing.tscn")

# NOTE: Commented lines don't affect this code at all, they won't even be executed.
