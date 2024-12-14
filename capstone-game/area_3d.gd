extends Area3D

@export var inside_castle = preload("res://insideCastle.tscn")

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.

func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:  # Ensure the entering body is the player
		call_deferred("change_scene")

#func _on_body_entered(body: Node3D) -> void:
	#if body is CharacterBody3D: # Replace with function body.
		#get_tree().change_scene_to_packed(inside_castle)

func change_scene() -> void:
	get_tree().change_scene_to_packed(inside_castle)
