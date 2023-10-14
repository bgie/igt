@tool
extends RefCounted
class_name Topic

var title: String :
	get:
		return _title

var steps: Array[TutorialStep] :
	get:
		return _steps


var _title : String
var _steps : Array[TutorialStep]

func _init(t: String, s: Array[TutorialStep]):
	_title = t
	_steps = s
