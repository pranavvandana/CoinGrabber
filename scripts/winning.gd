extends Control

func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
