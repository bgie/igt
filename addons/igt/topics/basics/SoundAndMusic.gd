@tool
extends Topic

func _init():
	super("Geluid en muziek (UNDER CONSTRUCTION)", [
		TutorialStep.new("Inleiding", 
			"Hoi!  In dit onderwerp gaan we leren hoe je geluiden en muziek in je spel gebruikt.\n\nDruk op de 'Volgende' knop om verder te gaan.",
			null, _show_2D_editor),
		TutorialStep.new("Scene maken", 
			"Voor deze oefening hebben we een scene nodig.\n\nMaak eerst een nieuwe scene, met '2D Scene' als root node.",
			null, Callable(),
			"", true,
			_has_empty_2d_scene),
		TutorialStep.new("AudioStreamPlayer toevoegen",
			"De eenvoudigste manier om geluid af te spelen is via een AudioStreamPlayer knoop.\n\nVoeg een 'AudioStreamPlayer' toe aan je scene.\nLet op! Er bestaat ook een AudioStreamPlayer2D en AudioStreamPlayer3D. Die gaan we later pas gebruiken.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/HBoxContainer:0/Button:0", true,
			_has_added_child_audioStreamPlayer_node),
		TutorialStep.new("Geluidsbestand kopieren", 
			"Om geluid af te spelen heb je een geluidsbestand nodig.\n\nGodot ondersteund 3 formaten: WAV, Ogg Vorbis and MP3.\n\nIk heb een geluid klaargezet bij de resources: 'cartoon-jump.mp3'",
			null, _copy_sound_resource,
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:1/FileSystemDock:0/VSplitContainer:0/Tree:0", false),
		TutorialStep.new("Geluidsbestand toewijzen", 
			"We gaan dit geluidsbestand toewijzen aan onze AudioStreamPlayer.\n\nSleep 'cartoon-jump.mp3' vanuit de resources naar 'Stream' in de Inspecteur.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/VBoxContainer:0/EditorPropertyResource:0", true,
			_audio_stream_player_has_stream),
		TutorialStep.new("Geluidsbestand afspelen", 
			"Om te testen kan je het geluid afspelen met de 'Playing' checkbox.\n\nDenk er aan dat je geluid moet opstaan in je besturingssysteem (Windows/MacOS/Linux).",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/VBoxContainer:0/EditorPropertyCheck:0", true),
		TutorialStep.new("Toonhoogte aanpassen", 
			"Er zijn een beperkt aantal instellingen die je kan wijzigen, zoals volume en toonhoogte.\n\nJe kan bijvoorbeeld de toonhoogte aanpassen met 'Pitch Scale'.\nZet dit op opgeveer 2 en speel het geluid nog eens af.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/VBoxContainer:0/EditorPropertyFloat:1/EditorSpinSlider:0", true),
		TutorialStep.new("Afspelen vanuit code", 
			"Vanuit code speel je een geluid af met de 'play()' functie."),

		TutorialStep.new("Under construction", 
			"This tutorial is not finished yet.\n\nYou have reached the end.",
			preload("res://addons/igt/topics/common/under_construction.png")),
#		TutorialStep.new("Scenes sluiten",
#			"We zijn klaar, je mag de open scenes sluiten.\n\nDat kan via het x kruisje bij elke scene in de knoppenbalk.\nOpslaan is niet nodig, deze tutorial is afgelopen.",
#			null, Callable(),
#			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:0/HBoxContainer:0/TabBar:0", true),
#		TutorialStep.new("Voltooid", 
#			"Dat waren alle basis principes rond geluid en muziek. Je hebt dit onderwerp afgerond.\n\nKlik op 'klaar' om terug te keren naar het hoofdmenu."),
	])

func _show_2D_editor():
	# EditorScript.new().get_editor_interface() is a workaround until 4.2 releases
	EditorScript.new().get_editor_interface().set_main_screen_editor("2D")

func _has_empty_2d_scene() -> bool:
	# EditorScript.new().get_editor_interface() is a workaround until 4.2 releases
	return EditorScript.new().get_editor_interface().get_edited_scene_root() is Node2D

func _has_added_child_audioStreamPlayer_node() -> bool:
	var dialog := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/CreateDialog:0")
	if dialog != null and dialog is Window and dialog.visible:
		# EditorScript.new().get_editor_interface() is a workaround until 4.2 releases
		var tween = EditorScript.new().get_editor_interface().get_base_control().create_tween()
		tween.tween_property(dialog, "position", Vector2i(dialog.position.x, 0), 0.3)
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().filter(func(node): return node is AudioStreamPlayer).size() == 1

func _move_resource_panel_split_up():
	var splitter := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0")
	if splitter.split_offset > -200:
		splitter.split_offset = -200

func _copy_sound_resource():
	_move_resource_panel_split_up()
	
	var file_system := EditorScript.new().get_editor_interface().get_resource_filesystem().get_filesystem()
	for i in file_system.get_file_count():
		print(file_system.get_file(i))
		if file_system.get_file(i) == "cartoon-jump.mp3":
			print("Sound resource already exists")
			return
	var dir := DirAccess.open(file_system.get_path())
	dir.copy("addons/igt/topics/basics/cartoon-jump.mp3", "cartoon-jump.mp3")
	print("Copied sound resource")
	EditorScript.new().get_editor_interface().get_resource_filesystem().scan()


func _audio_stream_player_has_stream() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().any(func(node): return node is AudioStreamPlayer and node.stream != null)



func _color_rect_was_made_larger() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().any(func(node): return node is ColorRect and (node.size.x > 80 and node.size.y > 80))

func _color_rect_was_moved() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().any(func(node): return node is ColorRect and (node.position.x > 100))

func _color_rect_was_moved_back() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().any(func(node): return node is ColorRect and (node.position.x < 80))
	
func _color_rect_was_reparented() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().filter(func(node): return node is ColorRect).size() == 2

func _color_rect_was_deleted() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().filter(func(node): return node is ColorRect).size() == 1

func _tree_has_rectangle_face() -> bool:
	var root := EditorScript.new().get_editor_interface().get_edited_scene_root()
	return root.get_children().size() == 1 and \
		root.get_children().all(func(node): return node is ColorRect and node.get_children().size() == 3)

func _root_node_was_renamed() -> bool:
	var root := EditorScript.new().get_editor_interface().get_edited_scene_root()
	return root.name.to_lower() == "blockface"

func _save_scene_dialog_visible() -> bool:
	var dialog := EditorSpy.alternative_path_to_node("Panel:0/EditorFileDialog:2")
	if dialog != null and dialog is Window and dialog.visible:
		# EditorScript.new().get_editor_interface() is a workaround until 4.2 releases
		var tween = EditorScript.new().get_editor_interface().get_base_control().create_tween()
		tween.tween_property(dialog, "position", Vector2i(dialog.position.x, 0), 0.3)
		return true
	return false

func _scene_saved() -> bool:
	var file_system := EditorScript.new().get_editor_interface().get_resource_filesystem().get_filesystem()
	for i in file_system.get_file_count():
		if file_system.get_file(i).get_basename().to_lower() == "block_face":
			return true
	return false

func _user_added_scene_as_child() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().filter(func(node): return node.name.to_lower() == "blockface").size() == 1

func _subscene_was_moved() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().filter(func(node): return node.position.x > 20).size() == 1

func _active_scene_has_switched() -> bool:
	var root := EditorScript.new().get_editor_interface().get_edited_scene_root()
	return root.name.to_lower() == "blockface"

func _active_scene_has_switched_back() -> bool:
	var root := EditorScript.new().get_editor_interface().get_edited_scene_root()
	return root.name.to_lower() == "control"

func _user_added_another_scene_as_child() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().filter(func(node): print(node.name); return node.name.to_lower().begins_with("blockface")).size() == 2
