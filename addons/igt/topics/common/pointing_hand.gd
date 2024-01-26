@tool
extends Control

const fade_when_mouse_is_near_distance_pixels = 20
const fade_speed = 1.5

@onready var highlight_rect: ColorRect = $Highlight
@onready var hand_position: Control = $Highlight/HandPosition
@onready var hand_texture: TextureRect = $Highlight/HandPosition/HandTexture
@onready var fish_texture: TextureRect = $Highlight/HandPosition/FishTexture

func _enter_tree():
	print("Pointing hand entering tree")
func _exit_tree():
	print("Pointing hand exiting tree")

func set_target(rect: Rect2, pointing:= true):
	print("Pointing to ", rect)
	highlight_rect.position = rect.position
	highlight_rect.size = rect.size
	if (highlight_rect.position.x + highlight_rect.size.x + hand_texture.size.x > get_viewport_rect().size.x):
		hand_position.position = Vector2(-80, 0.5 * rect.size.y)
		hand_texture.flip_h = false
		fish_texture.flip_h = true
	else:
		hand_position.position = Vector2(rect.size.x, 0.5 * rect.size.y)
		hand_texture.flip_h = true
		fish_texture.flip_h = false
	hand_texture.visible = pointing
	fish_texture.visible = not pointing

func _ready():
	$AnimationPlayer.play("bounce")

func _process(delta):
	var highlighted_area = hand_position.get_global_rect().grow(fade_when_mouse_is_near_distance_pixels)
	if highlighted_area.has_point(get_global_mouse_position()):
		hand_position.modulate.a = max(hand_position.modulate.a - (delta * fade_speed), 0.1)
	else:
		hand_position.modulate.a = min(hand_position.modulate.a + (delta * fade_speed), 1.0)
