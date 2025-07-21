extends Area2D # This line ensures that the script is connected to the Area 2D node

@onready var animation_player = $AnimationPlayer # @onready class explained in player script and $ is used to ensure a variable is equal to the AnimationPlayer Node 
signal collected
 
# This function script makes sure the animation for every coins work
func _ready():
	add_to_group("Coins")
	animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))

# This function ensures that the pickup sound is played once the player collides with the coin and the coin disappears 
func _on_animation_finished(anim_name):
	if anim_name == "pickup":
		queue_free()

# This function makes sure that the pickup sound playing and the coin disappearing happens in the game.
func _on_body_entered(_body: Node2D) -> void:
	var game_manager = get_tree().get_root().get_node("Game/GameManager")
	game_manager.add_point()
	game_manager.on_coin_collected()

	
	animation_player.play("pickup")
	emit_signal("collected")
	
# NOTE: Commented lines don't affect this code at all, they won't even be executed.
