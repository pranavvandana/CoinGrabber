extends Area2D # This line tells us that this script is connected to the Area2D node.

@onready var timer = $Timer # @onready symbolizes the same concept as before as explained previously in the player script and the variable timer is declared using var and the value of the variable is set equal to $Timer, showing that it is equal to the Timer node.

# body_entered(body:Node2D) signal is connected to Area2D, generating the _on_body_entered() function
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"): # Checks if the body paramter is in the player group
		# Remove the player and go to losing screen
		body.queue_free()
		get_tree().call_deferred("change_scene_to_file", "res://scenes/losing.tscn") 

# Declares a function called _on_timer_timeout() and 
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0 # The Engine singleton allows you to query and modify the project's run-time parameters, such as frames per second, time scale, and others. It also stores information about the current build of Godot, such as the current version. time_scale is an float value that has a default value set to 1.0

	get_tree().reload_current_scene() # This will just reload the current scene right after the code.

# NOTE: Commented lines don't affect this code at all, they won't even be executed.
