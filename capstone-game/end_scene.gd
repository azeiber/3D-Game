extends Control

const START_GAME = preload("res://main.tscn")

func _on_play_again_button_pressed() -> void:
	get_tree().change_scene_to_packed(START_GAME)
