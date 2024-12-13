extends Control

# Preload the scenes
const START_GAME = preload("res://main.tscn")
const TUTORIAL = preload("res://tutorial.tscn")

# Called when the start button is pressed
func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(START_GAME)

# Called when the tutorial button is pressed
func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_packed(TUTORIAL)

# Called when the exit button is pressed
func _on_exit_button_pressed() -> void:
	get_tree().quit()
