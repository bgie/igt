@tool
extends Topic

func _init():
	super("GDScript code (UNDER CONSTRUCTION)", [
		TutorialStep.new("Inleiding", 
			"Hoi!  In dit onderwerp gaan we de basis van GDScript leren, de taal waarmee je je spel tot leven kan brengen.\n\nDruk op de 'Volgende' knop om verder te gaan.",
			null, _show_2D_editor),
		TutorialStep.new("Scene maken", 
			"Voor deze oefening hebben we een scene nodig.\n\nMaak eerst een nieuwe scene, met '2D Scene' als root node.",
			null, Callable(),
			"", true,
			_has_empty_2d_scene),
		TutorialStep.new("Script toevoegen 1", 
			"Ik heb een Sprite2D voor je gemaakt.\nWe gaan deze olifant laten ronddraaien via code.\n\nVoeg een nieuw script toe voor de sprite.",
			null, _create_elephant_sprite,
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/HBoxContainer:0/Button:2", true,
			_is_add_script_dialog_open),
		TutorialStep.new("Script toevoegen 2", 
			"Godot stelt een naam voor op basis van de huidige node naam.\n\nKlikt op 'create' om het nieuwe script te maken.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/ScriptCreateDialog:0/HBoxContainer:0/Button:1", true,
			_current_node_has_script),
		TutorialStep.new("Script view", 
			"De editor veranderd vanzelf naar de 'script' view.\nHier kan je je code (scripts) bewerken.\n\nJe kan altijd wisselen tussen views met de knoppen hier boven.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/HBoxContainer:1/Button:2", false),
		TutorialStep.new("Script structuur 1", 
			"De editor heeft al een aantal regels script toegevoegd om je op weg te helpen.\n\nIk zal kort uitleggen waar elke regel voor dient."),
		TutorialStep.new("Script structuur 2", 
			"De eerste regel 'extends Sprite2D' is verplicht.\nHier bepaal je aan welke soort nodes je dit script kan hangen.\n\nDit script kan je gebruiken voor Sprite2D nodes.\nHier kan ook een ander type staan, bijvoorbeeld 'extends Camera2D'."),
		TutorialStep.new("Script structuur 3", 
			"Op meerdere plaatsen is een # (hekje) gebruikt.\n\nHiermee kan je commentaar in je script schrijven, bedoeld voor jezelf en andere mensen.\nAlle tekst achter het hekje wordt door godot genegeerd."),
		TutorialStep.new("Script structuur 4", 
			"Verder zie je twee regels die met 'func' beginnen.\n\nHet trefwoord 'func' zegt godot dat je een functie, een blok code, gaat schrijven.\nNa 'func' volgt de naam van de functie. Meer hierover later.\nAlle volgende regels die beginnen met tabs >| horen bij de functie."),
		TutorialStep.new("Script structuur 5", 
			"Die lege ruimte aan het begin van een regel heeft betekenis in GDScript. Net zoals bij Python.\n\nJe kan het vergelijken met scratch blokken die in mekaar schuiven.\nWe noemen dit 'inspringen'.",
			preload("res://addons/igt/topics/basics/scratch_nested_blocks.png")),
		TutorialStep.new("Script structuur 6",
			"Je kan kiezen of je tabs of spaties gebruikt, en hoeveel per inspringing.\n\nGDScript gebruikt standaard 1 tab per inspringing.",
			preload("res://addons/igt/topics/basics/tab_key.png")),
		TutorialStep.new("Script structuur 7", 
			"De 'ready' functie wordt 1 maal uitgevoerd in het begin.\n\nDe '_process' functie wordt telkens opnieuw uitgevoerd, bij elke frame.\nNormaal is dit 60 keer per seconde (60 FPS)."),
		TutorialStep.new("Sprite laten ronddraaien 1", 
			"Genoeg uitleg, laten we code schrijven!\n\nVerwijder het trefwoord 'pass' in de '_process' functie.\n\n'pass' is een plaatsvervanger, het is een lege instructie, die niets doet."),
		TutorialStep.new("Sprite laten ronddraaien 2", 
			"In plaats van 'pass' schrijf je:\n\t\trotation_degrees += 1\n\nDenk aan de tab aan het begin van de regel.\nSla de scene op en start deze scene met F6 of de knop rechtsboven.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/EditorRunBar:0/PanelContainer:0/HBoxContainer:0/Button:3", true,
			_is_game_playing),
		TutorialStep.new("Sprite laten ronddraaien 3", 
			"Prima! Je mag de game terug sluiten.",
			null, Callable(),
			"", true,
			_has_game_stopped_playing),
		TutorialStep.new("Optellen en aftrekken", 
			"De code is een instructie om de eigenschap 'rotation_degrees' (draaihoek) met 1 te verhogen.\n\nEr bestaat ook een -= om te verminderen."),
		TutorialStep.new("Sequenties 1", 
			"Je kan meerdere regels met instructies na mekaar schrijven.\nDe computer voert deze 1 voor 1 uit, van boven naar onder.\nDit gaat supersnel, miljoenen instructies per seconde."),
		TutorialStep.new("Sequenties 2", 
			"Voeg een regel code toe onder de vorige:\n\n\t\tposition.x -= 2\n\nTest dit opnieuw met F6 of de knop 'Deze scene scene afspelen'",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/EditorRunBar:0/PanelContainer:0/HBoxContainer:0/Button:3", true,
			_is_game_playing),
		TutorialStep.new("Sequenties 3", 
			"Goed zo. Merk op dat we 'position.x' gebruikten.\nDit zijn twee woorden met een punt tussen.\n\nEen Sprite2D heeft een eigenschap position.\nEn die heeft op zijn beurt 2 onderdelen: x en y.",
			null, Callable(),
			"", true,
			_has_game_stopped_playing),
		TutorialStep.new("Beslissingen 1", 
			"Een belangrijke bouwsteen voor code is de 'als-dan' instructie.\nDe computer gaat kijken of een voorwaarde waar is,\nen dit bepaald welke code daarna wordt uitgevoerd.\n\nIn GDScript is dit de 'if x:' instructie, waar 'x' een voorwaarde is."),
		TutorialStep.new("Beslissingen 2", 
			"Voeg de volgende 2 regels toe:\n\t\tif position.x < 0:\n\t\t\tposition.x = 1000\n\nMerk op dat de tweede regel 1 extra tab heeft aan het begin, in totaal dus 2.\nStart je programma nogmaals.",
			null, Callable(),
			"", true,
			_is_game_playing),
		TutorialStep.new("Beslissingen 3", 
			"Wacht tot de olifant helemaal naar links is geschoven.\nDan word de voorwaarde 'position.x < 0' waar.\nDe regel 'position.x = 1000' wordt dan uitgevoerd,\nen de olifant springt helemaal naar rechts."),
		TutorialStep.new("Beslissingen 4", 
			"Je mag de game terug sluiten.",
			null, Callable(),
			"", true,
			_has_game_stopped_playing),
		TutorialStep.new("Functies 1", 
			"Een andere belangrijke bouwsteen zijn functies.\nJe hebt nu zelf al code geschreven in de '_process' functie.\nJe kan je eigen functies maken, maar Godot heeft ook handige kant-en-klare functies."),
		TutorialStep.new("Functies 2", 
			"Een voorbeeld van een ingebouwde functie van Godot is 'randi_range'.\n\nDeze functie geeft je een willekeurig geheel getal tussen twee waardes."),
		TutorialStep.new("Functies 3", 
			"Voeg de volgende regel vanonder toe aan de 'if' blok: (Dus ook 2 tabs diep)\n\t\t\tposition.y = randi_range(0, 800)\n\nStart de game opnieuw.",
			null, Callable(),
			"", true,
			_is_game_playing),
		TutorialStep.new("Functies 4", 
			"De functie oproep 'randi_range(0, 800)' heeft 2 onderdelen.\n\n'randi_range' is de naam van de functie.\nDaarna komen er altijd haakjes.\nTussen de haakjes kunnen parameters staan, maar niet altijd."),
		TutorialStep.new("Functies 5", 
			"randi_range verwacht 2 waardes, een minimum en een maximum voor het willekeur getal.\n\nOmdat het een ingebouwde functie is, weet je niet welke code in de functie wordt uitgevoerd.\n\nDaarom bestaat er documentatie om je te helpen."),
		TutorialStep.new("Documentatie 1", 
			"Sluit je spel, als je dit nog niet deed.\n\nOpen dan de documentatie voor 'randi_range'.\nDat doe je door CTRL in te drukken en tegelijk het woord aan te klikken in je code."),
		TutorialStep.new("Documentatie 2", 
			"De documentatie vertelt je meestal wat je moet weten om een functie te gebruiken.\n\nNatuurlijk is er ook nog het internet.\nDe Godot documentatie staat op https://docs.godotengine.org\nEn je kan alles, zoals altijd, aan de eend vragen: https://duckduckgo.com"),
		TutorialStep.new("Documentatie 3", 
			"Je kan meerdere scripts en documentatie vensters open hebben.\nWisselen kan via de lijst linksboven in de script editor.\n\nKeer terug naar je script 'elephant.gd'.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:0/VBoxContainer:0/WindowWrapper:0/ScriptEditor:0/VBoxContainer:0/HSplitContainer:0/VSplitContainer:0/VBoxContainer:0/ItemList:0", true,
			_has_elephant_script_open),
		
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
	EditorInterface.set_main_screen_editor("2D")

func _has_empty_2d_scene() -> bool:
	return EditorInterface.get_edited_scene_root() is Node2D

func _create_elephant_sprite():
	var root := EditorInterface.get_edited_scene_root()
	var sprite := Sprite2D.new()
	sprite.name = "elephant"
	sprite.position = Vector2(300, 200)
	sprite.texture = load("res://addons/igt/topics/basics/pink_elephant.png")
	root.add_child(sprite, true)
	sprite.owner = root
	EditorInterface.get_selection().clear()
	EditorInterface.get_selection().add_node(sprite)
	EditorInterface.edit_node(sprite)

func _is_add_script_dialog_open() -> bool:
	var dialog := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/ScriptCreateDialog:0")
	if dialog != null and dialog is Window and dialog.visible:
		var tween = EditorInterface.get_base_control().create_tween()
		tween.tween_property(dialog, "position", Vector2i(dialog.position.x, 0), 0.3)
		return true
	return false

func _current_node_has_script() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().any(func(node: Node): return node is Sprite2D and node.get_script() != null)

func _is_game_playing() -> bool:
	return EditorInterface.is_playing_scene()

func _has_game_stopped_playing() -> bool:
	return not EditorInterface.is_playing_scene()

func _has_elephant_script_open() -> bool:
	return EditorInterface.get_script_editor().get_current_script().resource_path == "res://elephant.gd"
