extends Control # This line tells Godot that this script is connected to the Control Node

func _on_play_again_pressed() -> void: # Same concept as the Winning script, connecting the button signal to the function presed()
	get_tree().change_scene_to_file("res://scenes/game.tscn") # Same concept as Winning script, once you click the PLAY AGAIN! button, the screen will navigate you back to the main game screen.

# NOTE: Commented lines don't affect this code at all, they won't even be executed.
