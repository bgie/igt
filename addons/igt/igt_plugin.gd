@tool
extends EditorPlugin

const main_scene = preload("res://addons/igt/TutorialMain.tscn")

var main

func _enter_tree():
	main = main_scene.instantiate()
	EditorInterface.get_editor_main_screen().add_child(main)
	_make_visible(false)

func _exit_tree():
	if main:
		main.queue_free()


func _has_main_screen():
	return true


func _make_visible(visible):
	if main:
		main.visible = visible


func _get_plugin_name():
	return "Tutorial"


func _get_plugin_icon():
	return preload("res://addons/igt/godette_icon.png")
