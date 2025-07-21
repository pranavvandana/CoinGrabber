extends Area2D

@onready var animation_player = $AnimationPlayer
signal collected

func _ready(): 
	add_to_group("Coins")
	animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _on_animation_finished(anim_name):
	if anim_name == "pickup":
		queue_free()

func _on_body_entered(_body: Node2D) -> void:
	var game_manager = get_tree().get_root().get_node("Game/GameManager")
	game_manager.add_point()
	game_manager.on_coin_collected()

	
	animation_player.play("pickup")
	emit_signal("collected")
