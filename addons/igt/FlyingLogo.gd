@tool
extends Sprite2D

@onready var size := texture.get_size()

var velocity : Vector2
var angular_velocity : float

func _ready():
	visible = false

func _process(delta):
	var screen_size := get_viewport_rect().size
	if screen_size.is_zero_approx():
		return
	
	if not visible:
		position = Vector2(randf_range(0, screen_size.x), randf_range(0, screen_size.y))
		angular_velocity = randf_range(-20, 20)
		velocity = Vector2(randf_range(-50, 50), randf_range(-50, 50))
		var scale_val := randf_range(0.4, 1.0)
		scale = Vector2(scale_val, scale_val)
		z_index = int(scale_val * 100) - 100
		visible = true
	
	rotation_degrees += angular_velocity * delta
	position += velocity * delta

	if position.x < -size.x:
		position.x = screen_size.x + size.x
	elif position.x > screen_size.x + size.x:
		position.x = -size.x

	if position.y < -size.y:
		position.y = screen_size.y + size.y
	elif position.y > screen_size.y + size.y:
		position.y = -size.y
