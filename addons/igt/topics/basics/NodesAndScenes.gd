@tool
extends Topic

func _init():
	super("Knopen en scenes", [
		TutorialStep.new("Inleiding", 
			"Hoi!  In dit onderwerp gaan we leren wat een knoop (node) en een scene zijn.\n\nDruk op de 'Volgende' knop om verder te gaan.",
			null, _show_2D_editor),
		TutorialStep.new("Wat is een knoop?", 
			"Knopen (nodes) zijn de bouwstenen van je spel.\n\nEr zijn knopen for voor afbeeldingen, animaties, geluid, user interfaces, fysica, A.I..."),
		TutorialStep.new("Wat is een scene? (1)", 
			"Knopen kunnen in een scene gegroepeerd worden.\n\nScenes zijn herbruikbaar, en je zal er meestal meerdere hebben in je spel."),
		TutorialStep.new("Wat is een scene? (2)", 
			"De naam 'scene' verwijst naar een scene op het toneel, maar in Godot worden scenes voor meer gebruikt dan dat:\n\nNiet alleen het decor, maar hele game levels, de speler, tegenstanders, items,\nof user interface elementen zoals een dialoog."),
		TutorialStep.new("Een scene maken", 
			"Laten we een nieuwe scene maken.\n\nSelecteer 'Nieuwe Scene' uit het 'Scene' menu.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/MenuBar:0", true,
			_has_user_created_new_scene),
		TutorialStep.new("Wortelknoop (root node) kiezen", 
			"Uitstekend!\n\nNu moeten we onze eerst knoop kiezen (de 'root').\nDe verschillende soorten knopen komen later nog aan bod.\nKies 'Gebruikersomgeving' (User Interface) voor deze oefening.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/VBoxContainer:0/ScrollContainer:0/VBoxContainer:0/VBoxContainer:0/Button:2", true,
			_has_user_select_control_as_root),
		TutorialStep.new("Control node", 
			"Onze nieuwe scene heeft nu een root node van het type 'Control'.\n\nControl is het basistype van alle user interfaces nodes.\nControl zelf is onzichtbaar in het spel, maar kan dienen als container.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", false),
		TutorialStep.new("Root node", 
			"Alle knopen in een scene zijn georganiseerd in een boomstructuur (tree).\n\nEen scene heeft altijd 1 bovenste knoop, genaamd de root node.\nDe eerste knoop die we toevoegen wordt root node.",
			preload("res://addons/igt/topics/basics/scene_with_tree.svg")),
		TutorialStep.new("Ouder (parent) en kind (child) knopen", 
			"Knopen in een boom kunnen de rol van parent of child hebben.\n\nEen parent node kan meerdere children hebben.\nEen child node hoort altijd bij exact 1 parent.",
			preload("res://addons/igt/topics/basics/parent_child_tree.svg")),
		TutorialStep.new("Kleinkind knopen", 
			"Kind knopen kunnen op hun beurt opnieuw parent zijn van hun kinderen.\nJe kan zo diep gaan als je wil.\n\nDe parent node helemaal vanboven is onze root node.",
			preload("res://addons/igt/topics/basics/parent_child_child_tree.svg")),
		TutorialStep.new("Een knoop toevoegen",
			"We gaan nu een knoop toevoegen als kind van onze 'Control' node.\n\nKlik op de knop 'Knoop hieronder toevoegen'.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/HBoxContainer:0/Button:0", true,
			_is_add_node_dialog_visible),
		TutorialStep.new("Gekleurde rechthoek (ColorRect) toevoegen",
			"We gaan een eenvoudige knoop toevoegen die een gekleurde rechthoek toont.\n\nTyp 'ColorRect' in de zoekbalk, en selecteer dan het ColorRect type in de boom.\n\nKlik 'Maken' om te bevestigen.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/CreateDialog:0/HSplitContainer:0/VBoxContainer:0/MarginContainer:0/HBoxContainer:0/LineEdit:0", true,
			_has_added_child_colorRect_node),
		TutorialStep.new("Knoop toegevoegd", 
			"Goed gedaan!\n\nJe nieuwe knoop is toegevoegd aan de boom, als een kind van 'Control'.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", false),
		TutorialStep.new("Editor 2D aanzicht", 
			"Je ziet de gekleurde rechthoek ook in het midden, in de 2D preview.\nDaar kan je zien hoe je 2D scene er uitziet in het spel.\n\nAls de 2D preview niet actief is, kan je er naar toe gaan met de knop die ik aanwijs.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/HBoxContainer:1/Button:0", true),
		TutorialStep.new("Naar selecteer modus gaan", 
			"In de 2D preview kan je ook de positie en grootte van je zichtbare knopen wijzigen.\n\nLaten we dit proberen!\nZorg er eerst voor dat we in de 'Selecteermodus' zitten.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:1/VBoxContainer:0/CanvasItemEditor:0/HFlowContainer:0/HBoxContainer:0/Button:0", true),
		TutorialStep.new("Knoop groter/kleiner maken", 
			"Om een zichtbare knoop groter of kleiner te maken, kan je eenvoudig de oranje handvaten verslepen met de muis.\n\nMaak nu onze gekleurde rechthoek 2 keer zo groot.",
			preload("res://addons/igt/topics/basics/color_rect_handles_resize.png"), Callable(), "", false,
			_color_rect_was_made_larger),
		TutorialStep.new("Knoop verplaatsen", 
			"Geweldig!\n\nVerplaatst nu de rechthoek naar rechts.\nDit doe je door binnenin de rechthoek te klikken en te slepen.",
			preload("res://addons/igt/topics/basics/color_rect_handles_move.png"), Callable(), "", false,
			_color_rect_was_moved),
		TutorialStep.new("Een tweede knoop toevoegen",
			"Laten we nog een knoop toevoegen.\n\nKlik opnieuw op de 'Knoop hieronder toevoegen' knop.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/HBoxContainer:0/Button:0", true,
			_is_add_node_dialog_visible),
		TutorialStep.new("Nog een ColorRect", 
			"We willen nog een gekleurde rechthoek.\n\nOndertussen staat het type 'ColorRect' in het lijstje 'Onlangs', dus we moeten niet meer zoeken.\n\nKlik erop en klik dan 'Maken' om te bevestigen.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/CreateDialog:0/HSplitContainer:0/VSplitContainer:0/VBoxContainer:1/MarginContainer:0/ItemList:0", true,
			_has_added_grandchild_colorRect_node),
		TutorialStep.new("Child ColorRect", 
			"De nieuwe rechthoek is toegevoegd als kind van de eerste rechthoek, omdat de eerste rechthoek geselecteerd was.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", false),
		TutorialStep.new("Ouder en kind samen verplaatsen", 
			"Kinderen van een knoop worden onderdeel van de parent knoop.\n\nVerplaats nu de eerste, grootste rechthoek terug naar links, met de muis.\nJe zal merken dat de nieuwe, kleine rechthoek mee verplaatst.",
			null, Callable(), "", false,
			_color_rect_was_moved_back),
		TutorialStep.new("Ouder veranderen", 
			"Je kan een knoop ergens anders in de boom hangen en een andere ouder geven.\n\nLinks in de boom, sleep de nieuwe ColorRect met de muis en laat hem op de bovenste knoop (Control) vallen,\nzodat beide rechthoeken kind zijn van de Control.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", true,
			_color_rect_was_reparented),
		TutorialStep.new("Kind is vrij", 
			"De tweede rechthoek is niet langer een kind van de eerste rechthoek, maar rechtstreeks kind van de bovenste knoop 'Control'.\n\nVerplaats de eerste, grootste rechthoek nog eens naar rechts,\nen de kleine rechthoek zal niet meer meekomen.",
			null, Callable(), "", false,
			_color_rect_was_moved),
		TutorialStep.new("Een knoop verwijderen", 
			"Je kan een knoop natuurlijk ook verwijderen als je die niet meer nodig hebt.\n\nKlik met de rechtermuisknop op ColorRect2 en kies helemaal vanonder in het menu voor 'Knoop/knopen verwijderen'.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", true,
			_color_rect_was_deleted),
		TutorialStep.new("Oefening knopen maken (1)", 
			"Een kleine oefening:\nmaak 3 nieuwe ColorRects die allemaal kind zijn van de bestaande ColorRect.\nVerplaats de rechthoeken zodat ze er ongeveer uitzien als op deze tekening.",
			preload("res://addons/igt/topics/basics/rectangle_face.png")),
		TutorialStep.new("Oefening knopen maken (2)", 
			"De boom zou er uit moeten zien zoals op de tekening.",
			preload("res://addons/igt/topics/basics/tree_structure_rectangle_face.png"), 
			Callable(), "Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", false,
			_tree_has_rectangle_face),
		TutorialStep.new("Een knoop een naam geven", 
			"Netjes!\n\nEen andere belangrijke basis handeling is: je knopen een goede naam geven.\nKlik met rechtermuisknop op de 'Control' knoop en kies 'Naam wijzigen'. Gebruik de naam 'BlockFace'\nMerk op dat namen hoofdlettergevoelig zijn. 'BlockFace' is niet hetzelfde als 'blockface'.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", true,
			_root_node_was_renamed),
		TutorialStep.new("Een scene opslaan (1)", 
			"Dit, uhm, prachtige gezicht gaan we opslaan als scene.\n\nOpen het 'Scene' menu en klik op 'Scene Opslaan'",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/MenuBar:0", true,
			_save_scene_dialog_visible),
		TutorialStep.new("Een scene opslaan (2)", 
			"Godot stelt al een naam voor op basis van de naam van de root node.\nDe naam 'block_face.tscn' is goed.\n\nKlik op 'Opslaan' om de scene op te slaan.",
			null, Callable(),
			"Panel:0/EditorFileDialog:2/VBoxContainer:0/HSplitContainer:0/VBoxContainer:0/HBoxContainer:1/LineEdit:0", true,
			_scene_saved),
		TutorialStep.new("Scene bestand", 
			"Godot heeft de scene als bestand opgeslagen in je project map.\n\nJe kan alle bestanden zien in het paneel 'Bestandssysteem'\nHier vind je later ook de afbeeldingen, geluiden en andere assets van je project terug.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:1/FileSystemDock:0/VSplitContainer:0/Tree:0", false),

		TutorialStep.new("Een tweede scene maken", 
			"We gaan nu een tweede scene maken, om te leren hoe je scenes kan combineren.\n\nSelecteer 'Nieuwe Scene' uit het 'Scene' menu.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/MenuBar:0",  true,
			_has_user_created_new_scene),
		TutorialStep.new("Root node voor de tweede scene kiezen", 
			"Nu moeten opnieuw een root node (de eerst knoop) kiezen.\n\nKies nogmaals 'Gebruikersomgeving' (User Interface).",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/VBoxContainer:0/ScrollContainer:0/VBoxContainer:0/VBoxContainer:0/Button:2", true,
			_has_user_select_control_as_root),
		TutorialStep.new("Een scene in een scene (1)", 
			"Nu gaan we onze eerder gemaakte scene (BlockFace) toevoegen als onderdeel van deze nieuwe scene.\n\nDit kan heel eenvoudig door vanuit het paneel 'Bestandssysteem' het bestand 'block_face.tscn' te slepen,\nen dit op de root node 'Control' te laten vallen.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:1/FileSystemDock:0/VSplitContainer:0/Tree:0", true,
			_user_added_scene_as_child),
		TutorialStep.new("Een scene in een scene (2)",
			"Goed zo!\n\nDe hele 'BlockFace' scene is onderdeel van deze scene geworden.\n\nJe ziet de scene alsof het 1 enkele node is, de onderdelen van BlockFace zie je hier niet.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", false),
		TutorialStep.new("Geneste scene verplaatsen",
			"Ook als we de BlockFace scene verplaatsen, blijft het 1 geheel.\n\nVerplaats de BlockFace scene naar rechts.",
			null, Callable(), "", false,
			_subscene_was_moved),
		TutorialStep.new("Wisselen tussen scenes",
			"Wisselen tussen open scenes kan met de knoppenbalk hierboven. Klik op 'block_face' om deze scene terug te bekijken.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:0/HBoxContainer:0/TabBar:0", true,
			_active_scene_has_switched),
		TutorialStep.new("Geneste scene wijzigen (1)",
			"Als we de block_face scene wijzigen, gaan die wijzigingen overal toegepast worden.\n\nVerander, bij wijze van test, de grootte van 1 van de ogen van block_face.",
			preload("res://addons/igt/topics/basics/block_face_large_eye.png")),
		TutorialStep.new("Geneste scene wijzigen (2)",
			"Wijzigingen moeten wel eerst opgeslagen worden voor ze zichtbaar worden in de andere scenes.\n\nJe ziet dat er wijzigingen zijn door het (*) sterretje achter de scene naam in de knoppenbalk.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:0/HBoxContainer:0/TabBar:0", false),
		TutorialStep.new("Geneste scene wijzigen (3)", 
			"Opslaan is via de gekende manier.\n\nOpen het 'Scene' menu en klik op 'Scene Opslaan'\nDeze keer moeten we geen bestandsnaam geven, de scene is al eens opgeslagen.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/MenuBar:0", true),
		TutorialStep.new("Geneste scene wijzigen (4)",
			"Gaan we nu terug naar onze andere scene via de knoppenbalk vanboven,\ndan zullen we de wijzigingen aan block_face daar ook zien.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:0/HBoxContainer:0/TabBar:0", true,
			_active_scene_has_switched_back),
		TutorialStep.new("Meerdere scenes toevoegen (1)",
			"Waarom doen we dat nu, meerdere scenes maken?\n\nTen eerste is het handiger om dingen te groeperen dan om 1 grote boom te maken met alles in.\nTen tweede, we kunnen een scene meermaals herbruiken."),
		TutorialStep.new("Meerdere scenes toevoegen (2)", 
			"Voeg opnieuw een BlockFace scene toe als onderdeel van deze scene.\n\nSleep het bestand 'block_face.tscn' op de root node 'Control'.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:1/FileSystemDock:0/VSplitContainer:0/Tree:0", true,
			_user_added_another_scene_as_child),
#		TutorialStep.new("Under construction", 
#			"This tutorial is not finished yet.\n\nYou have reached the end.",
#			preload("res://addons/igt/topics/common/under_construction.png")),
		TutorialStep.new("Meerdere scenes toevoegen (3)", 
			"    Waaw! Geweldig!",
			preload("res://addons/igt/topics/basics/eddy.png")),
		TutorialStep.new("Scenes sluiten",
			"We zijn klaar, je mag de open scenes sluiten.\n\nDat kan via het x kruisje bij elke scene in de knoppenbalk.\nOpslaan is niet nodig, deze tutorial is afgelopen.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:0/HBoxContainer:0/TabBar:0", true),
		TutorialStep.new("Voltooid", 
			"Dat waren alle basis principes rond knopen en scenes. Je hebt dit onderwerp afgerond.\n\nKlik op 'klaar' om terug te keren naar het hoofdmenu."),
	])

func _show_2D_editor():
	EditorInterface.set_main_screen_editor("2D")

func _has_user_created_new_scene() -> bool:
	if EditorInterface.get_edited_scene_root() == null:
		var select_root_type_button := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/VBoxContainer:0/ScrollContainer:0/VBoxContainer:0/VBoxContainer:0/Button:2")
		if select_root_type_button != null and select_root_type_button.visible:
			return true
	return false

func _has_user_select_control_as_root() -> bool:
	return EditorInterface.get_edited_scene_root() is Control

func _is_add_node_dialog_visible() -> bool:
	var dialog := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/CreateDialog:0")
	if dialog != null and dialog is Window and dialog.visible:
		var tween = EditorInterface.get_base_control().create_tween()
		tween.tween_property(dialog, "position", Vector2i(dialog.position.x, 0), 0.3)
		return true
	return false

func _has_added_child_colorRect_node() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().any(find_colorRect_and_set_color)

func find_colorRect_and_set_color(node) -> bool:
	if node is ColorRect:
		node.color = Color("C0C0C0")
		return true
	return false

func _has_added_grandchild_colorRect_node() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().any(func(node): return node is ColorRect and node.get_children().any(func(grandchild): return grandchild is ColorRect))

func _color_rect_was_made_larger() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().any(func(node): return node is ColorRect and (node.size.x > 80 and node.size.y > 80))

func _color_rect_was_moved() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().any(func(node): return node is ColorRect and (node.position.x > 100))

func _color_rect_was_moved_back() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().any(func(node): return node is ColorRect and (node.position.x < 80))
	
func _color_rect_was_reparented() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().filter(func(node): return node is ColorRect).size() == 2

func _color_rect_was_deleted() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().filter(func(node): return node is ColorRect).size() == 1

func _tree_has_rectangle_face() -> bool:
	var root := EditorInterface.get_edited_scene_root()
	return root.get_children().size() == 1 and \
		root.get_children().all(func(node): return node is ColorRect and node.get_children().size() == 3)

func _root_node_was_renamed() -> bool:
	var root := EditorInterface.get_edited_scene_root()
	return root.name.to_lower() == "blockface"

func _save_scene_dialog_visible() -> bool:
	var dialog := EditorSpy.alternative_path_to_node("Panel:0/EditorFileDialog:2")
	if dialog != null and dialog is Window and dialog.visible:
		var tween = EditorInterface.get_base_control().create_tween()
		tween.tween_property(dialog, "position", Vector2i(dialog.position.x, 0), 0.3)
		return true
	return false

func _scene_saved() -> bool:
	var file_system := EditorInterface.get_resource_filesystem().get_filesystem()
	for i in file_system.get_file_count():
		if file_system.get_file(i).get_basename().to_lower() == "block_face":
			return true
	return false

func _user_added_scene_as_child() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().filter(func(node): return node.name.to_lower() == "blockface").size() == 1

func _subscene_was_moved() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().filter(func(node): return node.position.x > 20).size() == 1

func _active_scene_has_switched() -> bool:
	var root := EditorInterface.get_edited_scene_root()
	return root.name.to_lower() == "blockface"

func _active_scene_has_switched_back() -> bool:
	var root := EditorInterface.get_edited_scene_root()
	return root.name.to_lower() == "control"

func _user_added_another_scene_as_child() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().filter(func(node): print(node.name); return node.name.to_lower().begins_with("blockface")).size() == 2
