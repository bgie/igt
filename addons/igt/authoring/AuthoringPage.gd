@tool
extends Control

@export var editor_spy : EditorSpy

@onready var record_button : Control = $ColorRect/VBox/HBox/VBoxLeft/HBox/RecordButton
@onready var stop_button : Control = $ColorRect/VBox/HBox/VBoxLeft/HBox/StopButton
@onready var output_text_edit : Control = $ColorRect/VBox/HBox/VBoxLeft/OutputTextEdit
@onready var controls_tree : Tree = $ColorRect/VBox/HBox/VBoxRight/Tree
@onready var selected_item_label : Label = $ColorRect/VBox/HBox2/Panel/SelectedTreeItemLabel

var recording := false

func _ready():
	editor_spy.editor_control_clicked.connect(_on_editor_control_clicked)
	editor_spy.project_selected_nodes_changed.connect(_on_project_selected_nodes_changed)
	create_tree_items_recursive(EditorInterface.get_base_control())

func _on_record_button_pressed():
	recording = true
	record_button.disabled = true
	stop_button.disabled = false

func _on_stop_button_pressed():
	recording = false
	record_button.disabled = false
	stop_button.disabled = true

func _on_clear_button_pressed():
	output_text_edit.clear()

func _unhandled_key_input(event : InputEvent):
	if event.keycode == KEY_M and event.is_command_or_control_pressed() and event.pressed == true:
		if recording:
			_on_stop_button_pressed()
		else:
			_on_record_button_pressed()

func _on_update_tree_button_pressed():
	controls_tree.clear()
	create_tree_items_recursive(EditorInterface.get_base_control())

func create_tree_items_recursive(node: Node, tree_parent: TreeItem = null):
	var tree_item := controls_tree.create_item(tree_parent)
	tree_item.set_text(0, node.name + " (" + node.get_class() + ")")
	tree_item.set_metadata(0, node)
	for child in node.get_children():
		if (child is Control and child.visible) or (child is Window):
			create_tree_items_recursive(child, tree_item)


func _on_tree_item_selected():
	var tree_item := controls_tree.get_selected()
	if tree_item != null:
		var node = tree_item.get_metadata(0) as Node
		selected_item_label.text = editor_spy.get_node_alternative_path(node)
		if node is Control:
			editor_spy.point_at_control(node)

func _on_tree_nothing_selected():
	editor_spy.clear_pointing_hand()


func _on_editor_control_clicked(control: Control):
	if recording:
		var output := 'Mouse click on:\n'
		output += '  ' + str(EditorInterface.get_base_control().get_path_to(control)) + '\n'
		if control is EditorProperty:
			output += '    ' + control.get_class() + ': ' + control.get_edited_property() + \
			' for object: ' + str(EditorInterface.get_edited_scene_root().get_parent().get_path_to(control.get_edited_object())) + '\n'
		
		output += '  Alternative path: ' + editor_spy.get_node_alternative_path(control) + '\n'
		output_text_edit.text += output + '\n'
	
		var tree_item := controls_tree.get_root()
		while tree_item != null:
			if tree_item.get_metadata(0) == control:
				controls_tree.set_selected(tree_item, 0)
			tree_item = tree_item.get_next_in_tree()

func _on_project_selected_nodes_changed(nodes: Array[Node]):
	if recording:
		var node_paths := PackedStringArray()
		for node in nodes:
			node_paths.append(str(EditorInterface.get_edited_scene_root().get_parent().get_path_to(node)))
		output_text_edit.text += 'Selection changed to:\n  ' + ", ".join(node_paths) + '\n\n'


func _on_copy_path_button_pressed():
	var path := selected_item_label.text
	if not path.is_empty():
		DisplayServer.clipboard_set(path)


func _on_inspect_all_button_pressed():
	var root := get_tree().get_root()
	
	var nodes := editor_spy.get_children_recursive(root)
	for node in nodes:
		if node is Window:
			print(node.name, " ", node.get_class(), " ", node.get_path())
