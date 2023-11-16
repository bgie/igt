@tool
extends Topic

func _init():
	super("Basis knopen voor 2D", [
		TutorialStep.new("Inleiding", 
			"Hoi!  In dit onderwerp gaan we enkele basisknopen voor een 2d game leren gebruiken.\n\nDruk op de 'Volgende' knop om verder te gaan.",
			null, _show_2D_editor),
		TutorialStep.new("Scene maken", 
			"Voor deze oefening hebben we een scene nodig.\n\nMaak eerst een nieuwe scene, met '2D Scene' als root node.",
			null, Callable(),
			"", true,
			_has_empty_2d_scene),
		TutorialStep.new("Sprite2D toevoegen",
			"Een afbeelding in een 2d game noemen we een sprite.\nVoor een gewone sprite zonder animatie gebruiken we Sprite2D.\n\nVoeg een 'Sprite2D' toe aan je scene.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/HBoxContainer:0/Button:0", true,
			_has_added_child_sprite2d_node),
		TutorialStep.new("Afbeelding kopieren", 
			"Voor een sprite heb je een afbeelding nodig.\n\nIk heb een afbeelding klaargezet bij de resources: 'black-kitten8.png'",
			null, _copy_kitten_resource,
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:1/FileSystemDock:0/VSplitContainer:0/Tree:0", false),
		TutorialStep.new("Afbeelding toewijzen", 
			"We gaan deze afbeelding toewijzen aan onze Sprite2D.\n\nSleep 'black-kitten8.png' vanuit de resources naar 'Texture' in de Inspecteur.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/VBoxContainer:0/EditorPropertyResource:0", true,
			_sprite_2d_has_texture),
		TutorialStep.new("Naam knoop wijzigen", 
			"Prima!\nLaten we deze sprite nu een andere naam geven.\nKlik met rechtermuisknop op de 'Sprite2D' knoop en kies 'Naam wijzigen'.\nGebruik de naam 'Kitten'.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", true,
			_kitten_node_was_renamed),
		TutorialStep.new("Achtergrond sprite",
			"Een achtergrond voor je game is niet meer dan een grote sprite.\n\nMaak nog een Sprite2D node met de afbeelding 'FlatNight4BG.png',\nen noem deze 'Background'.",
			null, _copy_background_resource,
			"", true,
			_has_added_background_sprite2d_node),
		TutorialStep.new("Volgorde sprites (1)", 
			"De volgorde van de knopen in de tree is belangrijk!\n\nVoor knopen met dezelfde parent: de laatste knoop in de tree wordt ook het laatst getekend, en komt dus bovenop in de 2D view.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", false),
		TutorialStep.new("Volgorde sprites (2)", 
			"Is een knoop een kind van een andere knoop, dan wordt het kind later getekend, en komt dus bovenop in de 2D view.\n(Er is een optie om dit aan te passen, CanvasItem -> Visibility -> Show Behind Parent)",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", false),
		TutorialStep.new("Volgorde sprites (3)", 
			"Waarschijnlijk tekent je 'Background' knoop boven de 'Kitten', en dat willen we niet.\n\nVersleep de knopen zodat ze allebij kind zijn van de root (hetzelfde niveau), en 'Kitten' laatste komt in de tree.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", true,
			_has_put_kitten_last),

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

func _has_added_child_sprite2d_node() -> bool:
	var dialog := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/CreateDialog:0")
	if dialog != null and dialog is Window and dialog.visible:
		# EditorScript.new().get_editor_interface() is a workaround until 4.2 releases
		var tween = EditorScript.new().get_editor_interface().get_base_control().create_tween()
		tween.tween_property(dialog, "position", Vector2i(dialog.position.x, 0), 0.3)
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().filter(func(node): return node is Sprite2D).size() == 1

func _move_resource_panel_split_up():
	var splitter := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0")
	if splitter.split_offset > -200:
		splitter.split_offset = -200

func _copy_kitten_resource():
	_move_resource_panel_split_up()
	
	var file_system := EditorScript.new().get_editor_interface().get_resource_filesystem().get_filesystem()
	for i in file_system.get_file_count():
		print(file_system.get_file(i))
		if file_system.get_file(i) == "black-kitten8.png":
			print("Kitten resource already exists")
			return
	var dir := DirAccess.open(file_system.get_path())
	dir.copy("addons/igt/topics/basics/black-kitten8.png", "black-kitten8.png")
	print("Copied kitten resource")
	EditorScript.new().get_editor_interface().get_resource_filesystem().scan()

func _copy_background_resource():
	_move_resource_panel_split_up()
	
	var file_system := EditorScript.new().get_editor_interface().get_resource_filesystem().get_filesystem()
	for i in file_system.get_file_count():
		print(file_system.get_file(i))
		if file_system.get_file(i) == "FlatNight4BG.png":
			print("Background resource already exists")
			return
	var dir := DirAccess.open(file_system.get_path())
	dir.copy("addons/igt/topics/basics/FlatNight4BG.png", "FlatNight4BG.png")
	print("Copied background resource")
	EditorScript.new().get_editor_interface().get_resource_filesystem().scan()


func _sprite_2d_has_texture() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().any(func(node): return node is Sprite2D and node.texture != null)

func _kitten_node_was_renamed() -> bool:
	return EditorScript.new().get_editor_interface().get_edited_scene_root().get_children().any(func(node): return node is Sprite2D and node.name.to_lower() == "kitten")

func _has_added_background_sprite2d_node() -> bool:
	return EditorSpy.get_children_recursive(EditorScript.new().get_editor_interface().get_edited_scene_root()).any(func(node): return node is Sprite2D and node.texture != null and node.name.to_lower() == "background")

func _has_put_kitten_last() -> bool:
	var root_children := EditorScript.new().get_editor_interface().get_edited_scene_root().get_children()
	return root_children.size() == 2 and \
		root_children[0].name.to_lower() == 'background' and \
		root_children[1].name.to_lower() == 'kitten'
