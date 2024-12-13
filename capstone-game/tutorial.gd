extends Control

const START_GAME = preload("res://main.tscn")

# Called when the node enters the scene tree for the first time.
func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(START_GAME)
