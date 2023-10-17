@tool
extends Topic

func _init():
	super("Nodes and Scenes", [
		TutorialStep.new("Introduction", 
			"Hi!  In this topic we will learn about nodes and scenes.\n\nPress 'Next' to continue.",
			null, _show_2D_editor),
		TutorialStep.new("What are nodes?", 
			"Nodes are the building blocks of your game.\n\nThere are nodes for graphics, sound, user interfaces, physics, A.I. ..."),
		TutorialStep.new("What is a scene? (1)", 
			"Nodes can be grouped into a scene.\n\nScenes are reusable, and you will usually have multiple scenes in your game."),
		TutorialStep.new("What is a scene? (2)", 
			"The name 'scene' refers to a scene on stage, but scenes are used for more than that:\n\nNot only backgrounds and game levels, but also enemies, pickups, players, \nor user interface elements like dialogs."),
		TutorialStep.new("Create a scene", 
			"Lets create a new scene.\n\nSelect 'New Scene' from the 'Scene' menu.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/MenuBar:0",
			_has_user_created_new_scene),
		TutorialStep.new("Set a root node", 
			"Excellent!\n\nNow we have to choose our first node. The available types will be explained later.\n\nSelect 'User Interface' (Control) for this excercise.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/VBoxContainer:0/ScrollContainer:0/VBoxContainer:0/VBoxContainer:0/Button:2",
			_has_user_select_control_as_root),
		TutorialStep.new("Control node", 
			"Our new scene now has a root node of type 'Control'.\n\nControl is a base type for user interface elements.\nIt is invisible in the game, but can be used as a container or placeholder.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0"),
		TutorialStep.new("Root node", 
			"All the nodes in a scene will be organized in a tree.\n\nA scene always has 1 top-level node, called the root node.\n\nThe first node we add automatically becomes the root node.",
			preload("res://addons/igt/topics/basics/scene_with_tree.svg")),
		TutorialStep.new("Parent and child nodes", 
			"Nodes in a tree are also called parent and child nodes.\n\nA parent node can have multiple child nodes.\nA child can only belong to one parent.",
			preload("res://addons/igt/topics/basics/parent_child_tree.svg")),
		TutorialStep.new("Grandchild nodes", 
			"Child nodes can have children of their own.\n\nYou can go as deep as you need.\n\nThe top-most parent node is, you guessed it, the root node.",
			preload("res://addons/igt/topics/basics/parent_child_child_tree.svg")),
		TutorialStep.new("Add child node",
			"We will add a child node now.\n\nClick the 'Add Child Node' button.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/HBoxContainer:0/Button:0",
			_is_add_node_dialog_visible),
		TutorialStep.new("Add ColorRect", 
			"We will add a simple node that draws a colored rectangle.\n\nType 'ColorRect' in the search bar, then select the ColorRect type in the tree.\n\nClick 'Create' to confirm.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/CreateDialog:0/HSplitContainer:0/VBoxContainer:0/MarginContainer:0/HBoxContainer:0/LineEdit:0",
			_has_added_child_colorRect_node),
		TutorialStep.new("Node added", 
			"Well done!\n\nYour new node has been added to the tree, as a child of the root Control.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0"),
		TutorialStep.new("Editor 2D view", 
			"Controls are drawn in 2D.\n\nYou can see what they will look like in your game in the 2D view.\n\nYou can switch to the 2D view with the button I'm pointing at.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/HBoxContainer:1/Button:0"),
		TutorialStep.new("Switch to select mode", 
			"The 2D view also allows you to edit the position and size of nodes.\n\nLets try this!\nFirst, make sure you are in the 'Select' mode.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:1/VBoxContainer:0/CanvasItemEditor:0/HFlowContainer:0/HBoxContainer:0/Button:0"),
		TutorialStep.new("Resize node", 
			"To resize, simply use the round handles and drag them with the mouse.\n\nMake our ColorRect twice as large.",
			preload("res://addons/igt/topics/basics/color_rect_handles_resize.png"), Callable(), "",
			_color_rect_was_made_larger),
		TutorialStep.new("Move node", 
			"Great!\n\nNow move the node to the right.\nThis is done by clicking inside the node and dragging it.",
			preload("res://addons/igt/topics/basics/color_rect_handles_move.png"), Callable(), "",
			_color_rect_was_moved),
		TutorialStep.new("Add second child node",
			"Lets add another child node.\n\nClick the 'Add Child Node' button again.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/HBoxContainer:0/Button:0",
			_is_add_node_dialog_visible),
		TutorialStep.new("Add second ColorRect", 
			"We want another colored rectangle.\n\nThis time, the type 'ColorRect' is available in the 'Recently Used' list.\n\nClick it and then click 'Create' to confirm.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/CreateDialog:0/HSplitContainer:0/VSplitContainer:0/VBoxContainer:1/MarginContainer:0/ItemList:0",
			_has_added_grandchild_colorRect_node),

		TutorialStep.new("Under construction", 
			"This tutorial is not finished yet.\n\nYou have reached the end.",
			preload("res://addons/igt/topics/common/under_construction.png")),
		TutorialStep.new("Completed", 
			"Well done!  You have completed this topic.\n\nClick 'done' to return to the main menu."),
	])

func _show_2D_editor():
	# EditorScript.new().get_editor_interface() is a workaround until 4.2 releases
	EditorScript.new().get_editor_interface().set_main_screen_editor("2D")

func _has_user_created_new_scene() -> bool:
	# EditorScript.new().get_editor_interface() is a workaround until 4.2 releases
	if EditorScript.new().get_editor_interface().get_edited_scene_root() == null:
		var select_root_type_button := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/VBoxContainer:0/ScrollContainer:0/VBoxContainer:0/VBoxContainer:0/Button:2")
		if select_root_type_button != null and select_root_type_button.visible:
			return true
	return false

func _has_user_select_control_as_root() -> bool:
	# EditorScript.new().get_editor_interface() is a workaround until 4.2 releases
	return EditorScript.new().get_editor_interface().get_edited_scene_root() is Control

func _is_add_node_dialog_visible() -> bool:
	var dialog := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/CreateDialog:0")
	if dialog != null and dialog is Window and dialog.visible:
		# EditorScript.new().get_editor_interface() is a workaround until 4.2 releases
		var tween = EditorScript.new().get_editor_interface().get_base_control().create_tween()
		tween.tween_property(dialog, "position", Vector2i(dialog.position.x, 0), 0.3)
		return true
	return false

func _has_added_child_colorRect_node() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().any(find_colorRect_and_set_color)

func find_colorRect_and_set_color(node) -> bool:
	if node is ColorRect:
		node.color = Color("C0C0C0")
		return true
	return false

func _has_added_grandchild_colorRect_node() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().any(func(node): return node is ColorRect and node.get_children().any(func(grandchild): return grandchild is ColorRect))

func _color_rect_was_made_larger() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().any(func(node): return node is ColorRect and (node.size.x > 80 and node.size.y > 80))

func _color_rect_was_moved() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().any(func(node): return node is ColorRect and (node.position.x > 100))
