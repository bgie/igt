extends Node2D

const SPEED := 200.0

func _process(delta: float) -> void:
	var velocity := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += velocity * delta * SPEED
