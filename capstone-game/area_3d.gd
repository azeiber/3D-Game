extends Area3D

@export var inside_castle = preload("res://insideCastle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(body: Node) -> void:
	if body is CharacterBody3D: # Replace with function body.
		get_tree().change_scene(inside_castle)
