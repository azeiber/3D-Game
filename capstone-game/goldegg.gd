extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:  # Ensure the entering body is the player
		queue_free()
		


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
