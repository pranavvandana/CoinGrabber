extends Control # This line tells Godot that this script is connected to the Control Node

@onready var confetti = $CPUParticles2D
@onready var play_again_button = $"Play Again"

func _ready():
	confetti.emitting = false
	await get_tree().process_frame  # Ensures the scene is fully visible
	confetti.emitting = true
	
	play_again_button.visible = false
	await get_tree().create_timer(2.0).timeout  # Show button after delay
	play_again_button.visible = true

func _on_play_again_pressed() -> void: # _on_play_again_pressed is a signal in the Button Node under pressed(), so when you connect the signal, the function appears.
	get_tree().change_scene_to_file("res://scenes/game.tscn") # Basically, when you click on the button, titled PLAY AGAIN!, the screen will navigate you back to the initial game screen.

# NOTE: Commented lines don't affect this code at all, they won't even be executed.
