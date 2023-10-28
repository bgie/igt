@tool
extends Node
class_name EditorSpy

signal editor_control_clicked(control: Control)
signal project_selected_nodes_changed(nodes: Array[Node])

var pointing_hand_scene := preload("res://addons/igt/topics/common/pointing_hand.tscn")
var pointing_hand : Control = null

func _enter_tree():
	var window := get_tree().get_root()
	if window != null:
		window.window_input.connect(on_victim_window_input.bind(window))
	for node in get_children_recursive(window):
		if node is Window:
			node.window_input.connect(on_victim_window_input.bind(node))
	EditorScript.new().get_editor_interface().get_selection().selection_changed.connect(on_editor_selection_changed)
	print("Igt> Hooked into editor")
	pointing_hand = pointing_hand_scene.instantiate()
	pointing_hand.visible = false
	pointing_hand.z_index = RenderingServer.CANVAS_ITEM_Z_MAX
	get_tree().root.add_child.call_deferred(pointing_hand)
	print("Igt> Added hand indicator to editor")

func _exit_tree():
	if pointing_hand != null:
		if pointing_hand.get_parent():
			pointing_hand.get_parent().remove_child(pointing_hand)
		pointing_hand.queue_free()
		print("Igt> Removed hand indicator from editor")


func on_victim_window_input(event: InputEvent, victim: Window):
	if event is InputEventMouseButton and event.pressed:
		var controls := controls_under_mouse(event.global_position, victim, true)
		for control in controls:
			var control_from_our_own_tutorial := false
			var node : Node = control
			while node != null:
				if node is IGTMain:
					control_from_our_own_tutorial = true
					break
				node = node.get_parent()
			if not control_from_our_own_tutorial:
				editor_control_clicked.emit(control)


func on_editor_selection_changed():
	project_selected_nodes_changed.emit(EditorScript.new().get_editor_interface().get_selection().get_selected_nodes())

static func alternative_path_to_node(path: String) -> Node:
	var node := EditorScript.new().get_editor_interface().get_base_control().get_parent()
	for path_part in path.split("/", false):
		var node_parts := path_part.split(":")
		var node_class := node_parts[0]
		var index := int(node_parts[1])
		var found_child := false
		for n in node.get_children(true):
			if n.get_class() == node_class:
				if index <= 0:
					node = n
					found_child = true
					break
				else:
					index -= 1
		if not found_child:
			print("alternative_path_to_node did not find ", node_class, " as child of ", node.get_path(), " when looking up ", path)
			return null
	return node

func highlight_node(path: String, pointing := true):
	if path.is_empty():
		clear_pointing_hand()
		return
	var node := alternative_path_to_node(path)
	if node != null and node is Control:
		point_at_control(node, pointing)

func point_at_control(control: Control, pointing := true):
	var parent : Node = control
	while parent != null:
		if parent is Window:
			if pointing_hand.get_parent():
				pointing_hand.get_parent().remove_child(pointing_hand)
			parent.add_child(pointing_hand)
			pointing_hand.set_target(control.get_global_rect(), pointing)
			pointing_hand.visible = true
			break
		parent = parent.get_parent()

func clear_pointing_hand():
	pointing_hand.visible = false


func get_children_recursive(node: Node, include_internal := false) -> Array[Node]:
	var children := node.get_children(include_internal)
	var result : Array[Node] = children.duplicate()
	for child in children:
		result.append_array(get_children_recursive(child, include_internal))
	return result


func controls_under_mouse(pos: Vector2, root: Node = null, include_internal := false) -> Array[Control]:
	var results : Array[Control] = []
	var nodes_to_check : Array[Node] = []
	if root == null:
		nodes_to_check.append(get_tree().get_root())
	else:
		nodes_to_check.append(root)
	while not nodes_to_check.is_empty():
		var node := nodes_to_check.pop_front()
		if node.get_class() == "EditorNode":
			nodes_to_check.append_array(node.get_children(include_internal))
		elif node is Window and node.visible:
			nodes_to_check.append_array(node.get_children(include_internal))
		elif node is Control and node.visible:
			if node.get_global_rect().has_point(pos):
				results.append(node)
				var parent = node.get_parent()
				while parent != null and parent is Control and parent in results:
					results.erase(parent)
					parent = parent.get_parent()
				nodes_to_check.append_array(node.get_children(include_internal))
	return results

func get_node_alternative_path(node: Node) -> String:
	var result := PackedStringArray()
	while node != null:
		var parent := node.get_parent()
		if parent == null:
			break
		var index := 0
		var found_ourselves := false
		for child in parent.get_children(true):
			if child.get_class() == node.get_class():
				if child == node:
					result.append(node.get_class() + ":" + str(index))
					found_ourselves = true
				else:
					index += 1
		if not found_ourselves:
			result.append("?")
		node = parent
		if node.get_class() == "EditorNode":
			break
	result.reverse()
	return "/".join(result)
