extends Node

var score = 0
@onready var score_label = $ScoreLabel

func add_point(): 
	score += 1
	score_label.text = "You collected " + str(score) + " coins."

func _ready():
	for coin in get_tree().get_nodes_in_group("Coins"):
		coin.connect("collected", Callable(self, "_on_coin_collected"))

func on_coin_collected():
	var remaining = get_tree().get_nodes_in_group("Coins").size()
	if remaining == 1:
		reload_scene()

func reload_scene():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/Winning.tscn")
 
func show_lose_screen():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/losing.tscn")
