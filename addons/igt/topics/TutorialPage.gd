@tool
extends Control

signal done_clicked()

@export var editor_spy : EditorSpy

var topic : Topic :
	get:
		return _topic
	set(t):
		set_topic(t)

@onready var title_label : Label = $MainMenu/VBox/Label
@onready var steps_tree : Tree = $MainMenu/VBox/Tree
@onready var start_button : Button = $MainMenu/VBox/CenterContainer/StartButton
@onready var start_hightlight : Control = $MainMenu/VBox/CenterContainer/StartButton/HighlightRect
@onready var highlight_node_timer = $HighlightNodeTimer

var talking_godette_scene := preload("res://addons/igt/topics/common/TalkingGodette.tscn")
var talking_godette : Control

var _topic : Topic
var _step := -1
var _running := false
var _check_user_completed_action_script : Callable

func _enter_tree():
	talking_godette = talking_godette_scene.instantiate()
	talking_godette.visible = false
	talking_godette.z_index = RenderingServer.CANVAS_ITEM_Z_MAX - 1
	talking_godette.next_clicked.connect(_on_next_button_clicked)
	talking_godette.previous_clicked.connect(_on_previous_button_clicked)
	talking_godette.done_clicked.connect(_on_done_button_clicked)
	get_tree().root.add_child.call_deferred(talking_godette)
	print("Igt> Added talking godette to editor")
	
func _exit_tree():
	if talking_godette != null:
		get_tree().root.remove_child(talking_godette)
		talking_godette.queue_free()
		print("Igt> Removed talking godette from editor")

func set_topic(t : Topic):
	if _topic == t:
		return
		
	_topic = t

	set_running(false)
	
	steps_tree.clear()	
	if _topic != null:
		title_label.text = topic.title
		
		var tree_root := steps_tree.create_item()
		tree_root.set_text(0, "Inhoud")
		tree_root.set_metadata(0, 0)
		var index := 0
		for step in topic.steps:
			var tree_item := steps_tree.create_item(tree_root)
			tree_item.set_text(0, step.title)
			tree_item.set_metadata(0, index)
			index += 1
#
func _ready():
	start_hightlight.set_target(start_button.get_rect())

func _on_start_button_pressed():
	if _step < 0:
		_step = 0
	update_godette_content()
	set_running(true)

func set_running(v):
	if _running == v:
		return
	_running = v
	
	talking_godette.visible = _running
	start_button.disabled = _running || _topic == null
	start_hightlight.visible = !start_button.disabled
	if not _running:
		_check_user_completed_action_script = Callable()

func _on_next_button_clicked():
	if _step < _topic.steps.size() - 1:
		_step += 1
		update_godette_content()
	
func _on_previous_button_clicked():
	if _step > 0:
		_step -= 1
		update_godette_content()

func _on_done_button_clicked():
	set_running(false)
	done_clicked.emit()

func update_godette_content():
	var step := _topic.steps[_step]
	talking_godette.set_content(step.description, step.illustration, _step <= 0, _step >= _topic.steps.size()-1)
	if not step.displayed and step.enter_script.is_valid():
		step.enter_script.call()
	highlight_node_timer.start()
	if step.check_user_completed_action_script.is_valid() and not step.check_user_completed_action_script.call():
		_check_user_completed_action_script = step.check_user_completed_action_script
		talking_godette.set_next_button_enabled(false) 
	else:
		_check_user_completed_action_script = Callable()
		talking_godette.set_next_button_enabled(true)
	step.displayed = true

func _process(_delta):
	if _check_user_completed_action_script.is_valid():
		var action_completed : bool = _check_user_completed_action_script.call()
		if action_completed:
			talking_godette.set_next_button_enabled(true)
			_on_next_button_clicked()


func _on_tree_item_activated():
	var item := steps_tree.get_selected()
	if item != null:
		var index := int(item.get_metadata(0))
		if index >= 0 and index < _topic.steps.size():
			_step = index
			update_godette_content()
			set_running(true)

func _on_highlight_node_timer_timeout():
	var step := _topic.steps[_step]
	editor_spy.highlight_node(step.node_to_highlight)
