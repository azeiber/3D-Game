extends Area3D

@export var end_scene = preload("res://end_scene.tscn")

func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:  # Ensure the entering body is the player
		call_deferred("change_scene")

func change_scene() -> void:
	get_tree().change_scene_to_packed(end_scene)
