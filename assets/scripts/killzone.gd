extends Area2D

@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		# Remove the player and go to losing screen
		body.queue_free()
		get_tree().call_deferred("change_scene_to_file", "res://scenes/losing.tscn")


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
