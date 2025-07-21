extends Node # This line tells Godot that this script is connected to the Node Class. The Node Class was used since GameManager is not a scene, image, or object, it just has a child that displays the score text. Its' child is called ScoreLabel.

var score = 0 # This declares a variable called score and sets its value to 0, and since var was used, you can increment and decrement it
@onready var score_label = $ScoreLabel # concept of @onready explained in player script, and the variable score_label is being declared using var and it is set to $ScoreLabel, also equal to the Score Label text set to the Label Node  

# This is another test, this is a comment so it won't be executed, mainly doesn't affect the whole scene/code
func add_point(): # This function adds a point after collectinga coin
	score += 1
	score_label.text = "You collected " + str(score) + " coins." # This declares the amount of the coins you collected in a string displaying text on the screen.

# With this comment, this line will not and never affect the code at all.
func _ready(): # This line will initialize the function called _ready() 
	for coin in get_tree().get_nodes_in_group("Coins"): # This line will loop the Scene Tree, which knows all my nodes in my game and and will return a list of all nodes in the group "Coins for every coin"
		coin.connect("collected", Callable(self, "_on_coin_collected")) # I am telling each coin, "Hey, when you emit your collected signal, please call _on_coin_collected on me (this node)." and coin.connect() links the coin’s signal to your handler

# This function tells that if 1 coin is remaining and if that coin is grabbed, then the function reload_scene() should be called
func on_coin_collected():
	var remaining = get_tree().get_nodes_in_group("Coins").size()
	if remaining == 1:
		reload_scene()

# This function tells that reload_scene() will change to the Winning scene displaying YOU WON! in text
func reload_scene():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/Winning.tscn")
 
# This function tells that show_lose_screen() will change to the Losing screen displaying YOU LOSE! in text
func show_lose_screen():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/losing.tscn")

# NOTE: Commented lines don't affect this code at all, they won't even be executed.
