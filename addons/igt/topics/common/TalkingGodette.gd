@tool
extends Control

const COLLAPSE_ANIMATION_DURATION_SEC = 0.3

signal next_clicked()
signal previous_clicked()
signal done_clicked()

@onready var previous_button: Button = $SpeechBox/HBox/PreviousButton
@onready var next_button: Button = $SpeechBox/HBox/NextButton
@onready var done_button: Button = $SpeechBox/HBox/DoneButton

@export var collapsed := false :
	get:
		return $RestoreButton.visible
	set(v):
		set_collapsed(v)


func set_content(text: String, illustration: Texture2D, is_first: bool, is_last: bool):
	$SpeechBox/Content/RichTextLabel.text = text
	$SpeechBox/Content/Illustration.texture = illustration
	$SpeechBox/HBox/PreviousButton.visible = not is_first
	$SpeechBox/HBox/NextButton.visible = !is_last
	$SpeechBox/HBox/DoneButton.visible = is_last

func set_next_button_enabled(v: bool):
	$SpeechBox/HBox/NextButton.disabled = not v

func set_collapsed(v : bool):
	if $RestoreButton.visible == v:
		return

	$RestoreButton.visible = v
	$HideButton2.visible = !v
	
	var target_scale : Vector2
	target_scale = Vector2(0.2, 0.2) if v else Vector2(1.0,1.0)	
	create_tween().tween_property($SpeechBox, "scale", target_scale, COLLAPSE_ANIMATION_DURATION_SEC)
	
	var target_opacity : float
	target_opacity = 0.0 if v else 1.0
	create_tween().tween_property($Godette, "modulate:a", target_opacity, COLLAPSE_ANIMATION_DURATION_SEC)
	
	var tween := create_tween()
	$SpeechBox.visible = true
	tween.tween_property($SpeechBox, "modulate:a", target_opacity, COLLAPSE_ANIMATION_DURATION_SEC)
	tween.tween_property($SpeechBox, "visible", !v, 0.0)


func _on_restore_button_pressed():
	set_collapsed(false)

func _on_hide_button_pressed():
	set_collapsed(true)

func _on_previous_button_pressed():
	previous_clicked.emit()

func _on_next_button_pressed():
	next_clicked.emit()

func _on_done_button_pressed():
	done_clicked.emit()
