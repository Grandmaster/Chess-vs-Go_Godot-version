extends Control
var game = preload("res://Scenes/Game.tscn")

# Opens the game when "new game" is clicked
func _on_New_game_pressed():
	get_tree().change_scene_to(game)
