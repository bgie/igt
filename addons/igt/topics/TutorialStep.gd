@tool
extends RefCounted
class_name TutorialStep

var title: String:
	get:
		return _title
var description: String:
	get:
		return _description
var enter_script: Callable:
	get:
		return _enter_script
var node_to_highlight: String:
	get:
		return _node_to_highlight
var show_pointing_finger: bool:
	get:
		return _show_pointing_finger
var illustration: Texture2D:
	get:
		return _illustration
var check_user_completed_action_script: Callable:
	get:
		return _check_user_completed_action_script

var displayed := false

var _title: String
var _description: String
var _enter_script: Callable
var _node_to_highlight: String
var _show_pointing_finger:=true
var _illustration: Texture2D
var _check_user_completed_action_script: Callable

func _init(title: String, description: String, illustration: Texture2D = null, enter_script := Callable(), node_to_highlight := "", show_pointing_finger:=true, check_user_completed_action_script:= Callable()):
	_title = title
	_description = description
	_illustration = illustration
	_enter_script = enter_script
	_node_to_highlight = node_to_highlight
	_show_pointing_finger = show_pointing_finger
	_check_user_completed_action_script = check_user_completed_action_script
