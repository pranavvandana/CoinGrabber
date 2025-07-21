extends Control

@onready var confetti = $CPUParticles2D
@onready var play_again = $"Play Again"
@onready var animation_player = $AnimationPlayer

func _ready():
	play_again.visible = false
	confetti.emitting = false
	await get_tree().process_frame
	confetti.restart() # Force restart
	confetti.emitting = true
	await get_tree().create_timer(2.0).timeout
	play_again.visible = true


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
