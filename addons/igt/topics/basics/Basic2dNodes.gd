@tool
extends Topic

func _init():
	super("2D sprites en camera's", [
		TutorialStep.new("Inleiding", 
			"Hoi!  In dit onderwerp gaan we twee basisknopen voor een 2d game leren gebruiken.\n\nDruk op de 'Volgende' knop om verder te gaan.",
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
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:1/FileSystemDock:0/SplitContainer:0/Tree:0", false),
		TutorialStep.new("Afbeelding toewijzen", 
			"We gaan deze afbeelding toewijzen aan onze Sprite2D.\n\nSleep 'black-kitten8.png' vanuit de resources naar 'Texture' in de Inspecteur.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/VBoxContainer:0/EditorPropertyResource:0", true,
			_sprite_2d_has_texture),
		TutorialStep.new("2D view schuiven", 
			"Prima! We zien de kitten verschijnen in onze 2D view.\nMaar ze staat half buiten beeld.\nGebruik het verschuif gereedschap (Pan) om het beeld te verschuiven via klikken en slepen.\nDit verschuift enkel het beeld in de editor, niet de positie van de kitten in het spel.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:0/VBoxContainer:0/CanvasItemEditor:0/MarginContainer:0/HFlowContainer:0/HBoxContainer:0/Button:6", true),
		TutorialStep.new("2D view in/uitzoomen", 
			"Nu we toch bezig zijn, je kan ook in- en uitzoomen.\n\nEr zijn + en - knopjes en je ziet de huidige zoom als percentage.\n\nHet scrollwiel van de muis werkt ook.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:0/VBoxContainer:0/CanvasItemEditor:0/VSplitContainer:0/HSplitContainer:0/HSplitContainer:0/Control:0/CanvasItemEditorViewport:0/VBoxContainer:0/HBoxContainer:0/EditorZoomWidget:0", true),
		TutorialStep.new("Naam knoop wijzigen", 
			"Laten we deze sprite nu een andere naam geven.\n\nKlik met rechtermuisknop op de 'Sprite2D' knoop en kies 'Naam wijzigen'.\nGebruik de naam 'Kitten'.",
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
			"Is een knoop een kind van een andere knoop, dan wordt het kind later getekend, en komt dus bovenop in de 2D view.\n\n(Er is een optie om dit aan te passen, CanvasItem -> Visibility -> Show Behind Parent)",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", false),
		TutorialStep.new("Volgorde sprites (3)", 
			"Waarschijnlijk tekent je 'Background' knoop boven de 'Kitten', en dat willen we niet.\n\nVersleep de knopen zodat ze allebij kind zijn van de root (hetzelfde niveau), en 'Kitten' laatste komt in de tree.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", true,
			_has_put_kitten_last),
		TutorialStep.new("Properties (1)", 
			"Netjes!\n\nNu gaan we een aantal veel gebruikte eigenschappen (properties) van Sprite2D bekijken."),
		TutorialStep.new("Properties (2)", 
			"Een Sprite2D is een soort Node2D, en daarom heeft Sprite2D de eigenschappen van een Node2D ook.\n\nDe eigenschappen (properties) behorende bij Node2D zijn:\npositie, schaal, rotatie en scheefheid.",
			null, _unfold_node2d_properties,
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:3", false),
		TutorialStep.new("Scheefheid instellen", 
			"Je kan elk van deze waardes aanpassen.\n\nSelecteer de kitten (links in de tree) en verschuif de scheefheid (skew) slider uit de inspecteur naar rechts.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:3/VBoxContainer:0/EditorPropertyFloat:1", true,
			_has_changed_kitten_skew),
		TutorialStep.new("Scheefheid resetten", 
			"Pas je iets aan, dan verschijnt de kere-keer-were pijl waarmee je terug de standaard-waarde kan herstellen (resetten).\n\nReset de scheefheid (skew) van de kitten terug naar 0.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:3/VBoxContainer:0/EditorPropertyFloat:1", true,
			_has_reset_kitten_skew),
		TutorialStep.new("Schaal instellen (1)", 
			"Voor onze oefening gaan we de kitten wat kleiner maken.\nDe schaal (Scale) heeft een x en een y component (breedte en hoogte).\nNormaal staat lock ratio (het ketting icoon) aan en worden x en y samen aangepast.\n\nVerander x: typ 0.5 en druk Enter.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:3/VBoxContainer:0/EditorPropertyVector2:1", true,
			_has_changed_kitten_scale),
		TutorialStep.new("Schaal instellen (2)", 
			"Hetzelfde kan je visueel doen met het schaal gereedschap.\n\nActiveer het schaal gereedschap en klik en sleep op de kitten om die groter/kleiner kleiner te maken.\nIn dit geval kunnen x en y verschillen, en kan je de kitten plat of smal maken.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:0/VBoxContainer:0/CanvasItemEditor:0/MarginContainer:0/HFlowContainer:0/HBoxContainer:0/Button:3", true,
			_has_changed_kitten_scale_again),
		TutorialStep.new("Undo/redo", 
			"(Bijna) alles wat je aanpast via de editor kan je ongedaan maken (undo).\n\nIn het 'Scene' menu vindt je 'Ongedaan maken' met als sneltoets Ctrl+Z.\nMaak je laatste wijzigingen ongedaan tot de schaal van de kitten terug (0.5, 0.5) is.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/MenuBar:0", true,
			_has_changed_kitten_scale),
		TutorialStep.new("Positie en rotatie", 
			"Positie en rotatie aanpassen is even makkelijk. Je kan ze visueel slepen in de 2D view, of je kan de waardes aanpassen in de inspecteur.\n\nVerschuif de kitten naar onder met het verplaats gereedschap, zodat ze niet meer in de lucht zweeft.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VBoxContainer:0/VSplitContainer:0/VSplitContainer:0/VBoxContainer:0/PanelContainer:0/VBoxContainer:0/CanvasItemEditor:0/MarginContainer:0/HFlowContainer:0/HBoxContainer:0/Button:1", true,
			_has_moved_kitten),
		TutorialStep.new("Spiegelen", 
			"Er zijn ook een aantal eigenschappen specifiek voor Sprite2D.\n\nJe kan de sprite bijvoorbeeld spiegelen (flip).\nZet 'flip_h' aan en kijk welk effect dit heeft.",
			null, _unfold_sprite2d_properties,
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:0/VBoxContainer:0/EditorPropertyCheck:1", true,
			_has_mirrored_kitten),
		TutorialStep.new("Region", 
			"Andere eigenschappen van Sprite2D gaan we nog niet gebruiken in deze basis oefening:\n'Region' gebruik je voor spritesheets.\n\nDan heb je een afbeelding waar meerdere sprites tegelijk opstaan. Via een region gebruik je daar maar 1 stukje van."),
		TutorialStep.new("Animation", 
			"Sprite2D heeft beperkte instellingen voor animatie (Animation), als je animatie handmatig via code wil doen.\n\nMaar er is een AnimatedSprite2D die animaties veel makkelijker maakt."),
		TutorialStep.new("CanvasItem properties", 
			"Wel zijn er nog enkele basis eigenschappen die alle 2D elementen hebben (ook user interface controls).\n\nSprite2D is ook een CanvasItem, en heeft eigenschappen in verband met:\nzichtbaarheid, volgorde, textuur en materiaal."),
		TutorialStep.new("Zichtbaarheid", 
			"Onder zichtbaarheid (visibility) staat bijvoorbeeld zichtbaarheid aan/uit.\n\nMaak de kitten onzichtbaar door visible UIT te zetten.",
			null, _unfold_visibility_properties,
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:4/VBoxContainer:0/EditorPropertyCheck:0", true,
			_has_hidden_kitten),
		TutorialStep.new("Kleur aanpassen", 
			"We kunnen de kleur van onze kitten aanpassen (modulate).\nModuleren verandert wit in een kleur naar keuze, maar zwart blijft zwart.\n\nMaak de kitten terug zichtbaar, en verminder de groen (G) waarde\nzodat de kitten roze/paars wordt.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:4/VBoxContainer:0/EditorPropertyColor:0", true,
			_has_shown_kitten_and_modulated),
		TutorialStep.new("Andere CanvasItem eigenschappen", 
			"De andere eigenschappen van CanvasItem gaan we nog niet verder in detail behandelen."),

		TutorialStep.new("Scene opslaan", 
			"Om een andere basis knoop uit te leggen, moeten we eerst onze scene opslaan.\nKies 'Scene Opslaan' uit het 'Scene' menu, en gebruik een naam naar keuze. (bvb oefening1.tscn)",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/MenuBar:0", true,
			_has_user_saved_scene),
		TutorialStep.new("Spel afspelen",
			"Nu deze scene is opgeslagen, kunnen we ons spel afspelen.\n\nKlik op de play button, of gebruik de sneltoets F5 om je spel af te spelen.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/EditorRunBar:0/PanelContainer:0/HBoxContainer:0/Button:0", true,
			_is_select_main_scene_dialog_open),
		TutorialStep.new("Hoofdscene kiezen",
			"Als dit de eerste keer is, vraagt Godot welke de startscene moet worden.\n\nDe startscene is degene die opstart bij het starten van je project.\nIn je game kan je later via code tussen scenes wisselen.\n\nKies 'Huidige Selecteren'.",
			null, Callable(),
			"", true,
			_is_game_playing),
		TutorialStep.new("Afspelen zonder camera",
			"Nu kan je je spel testen.\n\nWe zien onmiddellijk dat onze kitten maar half in beeld is.\nIn de editor hebben we geschoven (pan) om onze scene goed te kunnen bekijken."),
		TutorialStep.new("Mogelijkheden Camera2D",
			"Voor IN het spel bestaat er een Camera2D knoop.\nDe speler gaat als het ware 'door' de camera heen kijken naar de scene.\nDeze camera kan bewegen, in- en uitzoomen, ronddraaien... of we kunnen tussen cameras wisselen."),
		TutorialStep.new("Afspelen stoppen",
			"Laten we een camera toevoegen!\n\nStop het spel door het venster te sluiten, of via de 'Stop' knop in de godot editor.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/EditorRunBar:0/PanelContainer:0/HBoxContainer:0/Button:2", true,
			_has_game_stopped_playing),

		TutorialStep.new("Camera2D toevoegen",
			"De positie van de Camera2D in de tree heeft belang.\n\nZorg dat de root node 'Node2D' geselecteerd is en voeg een Camera2D knoop toe.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/HBoxContainer:0/Button:0", true,
			_has_added_camera2d_node),
		TutorialStep.new("Spel starten met camera",
			"De Camera2D toont als roze rechthoek in de 2D view van de editor.\nDit is het gebied waar de camera naar kijkt.\n\nStart het spel opnieuw via play of F5.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/EditorRunBar:0/PanelContainer:0/HBoxContainer:0/Button:0", true,
			_is_game_playing),
		TutorialStep.new("Afspelen met camera stoppen",
			"Dit lijkt er al meer op!\n\nSluit het spel terug af om verder te gaan.",
			preload("res://addons/igt/topics/basics/kitten_on_background.png"), Callable(),
			"", true,
			_has_game_stopped_playing),
		TutorialStep.new("Camera2d eigenschappen",
			"Camera2D is ook een Node2D en heeft ook een positie, rotatie, schaal en scheefheid, MAAR enkel de eerste 2 werken.\n\nJe kan de positie van de camera aanpassen zoals we bij de kitten deden.\nVerschuif de camera een stukje naar onder.",
			null, Callable(),
			"", true,
			_has_moved_camera),
		TutorialStep.new("Camera2d roteren",
			"Roteren van de camera is ook mogelijk, maar er is een optie om de rotatie te negeren die standaard AAN staat.\n\nZet 'Ignore Rotation' uit en verander de camera rotation zoals je bij Sprite2D deed.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/VBoxContainer:0/EditorPropertyCheck:0", true,
			_has_rotated_camera),
		TutorialStep.new("Camera2d rotatie resetten",
			"Een ronddraaiende camera is een goede manier om je spelers misselijk te maken!\n\nGebruik de kere-keer-were pijltjes om 'Ignore Rotation' en de rotation hoek terug te zetten.",
			null, Callable(),
			"", true,
			_has_un_rotated_camera),
		
		TutorialStep.new("Kitten beweeg script toevoegen",
			"De positie van de camera wordt belangrijk als we dingen gaan laten bewegen (via code).\n\nIk heb een eenvoudig beweeg script 'keyboard_movement.gd' klaargezet bij de resources.\n\nSleep dit van de resources en laat het op 'kitten' vallen in de tree.",
			null, _copy_movement_script_resource,
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:1/FileSystemDock:0/SplitContainer:0/Tree:0", false,
			_has_attached_script),
		TutorialStep.new("Kitten beweeg script testen", 
			"Dankzij dit script kan je de kitten bewegen met de pijltoetsen tijdens het spel.\n\nStart de game (F5) en gebruik de pijltoetsen om de kitten te bewegen.\nMerk op dat je de kitten 'buiten beeld' kan laten gaan.\nStop daarna het spel terug.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/EditorRunBar:0/PanelContainer:0/HBoxContainer:0/Button:0", true),
		TutorialStep.new("Camera aan kitten hangen", 
			"We hadden net een vaste camera.\nDe camera hangt aan de root node en beweegt niet mee.\n\nWillen we dat de camera de kitten volgt, dan maken we de camera knoop kind van de kitten knoop. Versleep de camera node in de tree.",
			preload("res://addons/igt/topics/basics/camera_node_child_of_kitten.png"), Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/SceneTreeEditor:0/Tree:0", true,
			_camera_child_of_kitten),
		TutorialStep.new("Camera aan kitten testen", 
			"Nu de camera knoop aan de kitten hangt, gaat de camera meebewegen met de kitten.\n\nTest dit door het spel te starten en de kitten te bewegen.\nStop daarna het spel terug.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/EditorRunBar:0/PanelContainer:0/HBoxContainer:0/Button:0", true),
		TutorialStep.new("Camera2D inzoomen (1)",
			"De camera kan natuurlijk in- en uitzoomen. Daarvoor is er de zoom eigenschap.\n(Dus NIET de schaal/scale property, wat verwarrend is!)\n\nPas de zoom aan naar x=2 en y=2.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/VBoxContainer:0/EditorPropertyVector2:1", true,
			_has_changed_camera_zoom),
		TutorialStep.new("Camera2D inzoomen (2)", 
			"Je ziet dat de roze rechthoek in de 2D view maar half zo groot is.\n\nEen groter getal voor zoom == meer inzoomen == meer details zien van een kleiner stukje.\n\nJe mag ook kijken hoe het er uitziet als je het spel start."),
		TutorialStep.new("Camera2D slepen instellen",
			"Je mag de zoom terug op (1,1) zetten.\n\nVolgende eigenschap die we gaan testen is 'slepen (drag)' van de camera.\nIn de 'drag' sectie mag je horizontaal en verticaal enabled beiden AAN zetten.",
			null, _unfold_camera_drag_properties,
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:3", true,
			_has_changed_camera_drag),
		TutorialStep.new("Camera2D slepen testen", 
			"Het effect hiervan zie je enkel als je het spel start.\n\nStart het spel en beweeg met de kitten naar de rand.\nDe camera gaat pas schuiven als je dichter bij de rand komt.\nStop het spel als je klaar bent.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/EditorRunBar:0/PanelContainer:0/HBoxContainer:0/Button:0", true),
		TutorialStep.new("Camera2D slepen aanpassen", 
			"Hoe ver je mag bewegen voor de camera gaat volgen?\nDat stel je in met de 4 marges (margins).\n\nTest zelf eens het verschil tussen alle marges op 0.2 of op 0.8",
			null, Callable(),
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:3/VBoxContainer:0/EditorPropertyFloat:2"),
		TutorialStep.new("Camera2D smoothing instellen",
			"Nog een eigenschap van de camera is smoothing.\n\nJe mag zelf ontdekken wat dit doet!\nZet smoothing enabled AAN en gebruik een speed van 1 px/s.",
			null, _unfold_camera_smoothing_properties,
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:1", true,
			_has_changed_camera_smoothing),
		TutorialStep.new("Camera2D smoothing testen", 
			"Kijk eens wat de camera nu doet als je met de kitten beweegt.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/EditorRunBar:0/PanelContainer:0/HBoxContainer:0/Button:0", true),
		TutorialStep.new("Camera2D limieten instellen",
			"De laatste eigenschap die we gaan bekijken zijn camera limieten.\n\nZet alles van smoothing en drag terug uit, en stel de bottom limiet in op 350.",
			null, _unfold_camera_limit_properties,
			"Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:0", true,
			_has_changed_camera_limit),
		TutorialStep.new("Camera2D limieten testen", 
			"Start het spel nog eens.\n\nBeweeg naar boven en onder, en merk dat de camera stopt met volgen als je te ver naar onder gaat. Zo kan je zorgen dat de rand van je achtergrond nooit in beeld komt.",
			null, Callable(),
			"Panel:0/VBoxContainer:0/EditorTitleBar:0/EditorRunBar:0/PanelContainer:0/HBoxContainer:0/Button:0", true),
		TutorialStep.new("Scene sluiten",
			"We zijn klaar, je mag de open scene opslaan en sluiten.\n\nKlik op 'klaar' om terug te keren naar het hoofdmenu.")
	])

func _show_2D_editor():
	EditorInterface.set_main_screen_editor("2D")

func _has_empty_2d_scene() -> bool:
	return EditorInterface.get_edited_scene_root() is Node2D

func _has_added_child_sprite2d_node() -> bool:
	var dialog := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/SceneTreeDock:0/CreateDialog:0")
	if dialog != null and dialog is Window and dialog.visible:
		var tween = EditorInterface.get_base_control().create_tween()
		tween.tween_property(dialog, "position", Vector2i(dialog.position.x, 0), 0.3)
	return EditorInterface.get_edited_scene_root().get_children().filter(func(node): return node is Sprite2D).size() == 1

func _move_resource_panel_split_up():
	var splitter := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0")
	if splitter.split_offset > -200:
		splitter.split_offset = -200

func _copy_kitten_resource():
	_move_resource_panel_split_up()
	
	var file_system := EditorInterface.get_resource_filesystem().get_filesystem()
	for i in file_system.get_file_count():
		print(file_system.get_file(i))
		if file_system.get_file(i) == "black-kitten8.png":
			print("Kitten resource already exists")
			return
	var dir := DirAccess.open(file_system.get_path())
	dir.copy("addons/igt/topics/basics/black-kitten8.png", "black-kitten8.png")
	print("Copied kitten resource")
	EditorInterface.get_resource_filesystem().scan()

func _copy_background_resource():
	_move_resource_panel_split_up()
	
	var file_system := EditorInterface.get_resource_filesystem().get_filesystem()
	for i in file_system.get_file_count():
		print(file_system.get_file(i))
		if file_system.get_file(i) == "FlatNight4BG.png":
			print("Background resource already exists")
			return
	var dir := DirAccess.open(file_system.get_path())
	dir.copy("addons/igt/topics/basics/FlatNight4BG.png", "FlatNight4BG.png")
	print("Copied background resource")
	EditorInterface.get_resource_filesystem().scan()


func _sprite_2d_has_texture() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().any(func(node): return node is Sprite2D and node.texture != null)

func _kitten_node_was_renamed() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().any(func(node): return node is Sprite2D and node.name.to_lower() == "kitten")

func _has_added_background_sprite2d_node() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Sprite2D and node.texture != null and node.name.to_lower() == "background")

func _has_put_kitten_last() -> bool:
	var root_children := EditorInterface.get_edited_scene_root().get_children()
	return root_children.size() == 2 and \
		root_children[0].name.to_lower() == 'background' and \
		root_children[1].name.to_lower() == 'kitten'

func _unfold_node2d_properties() -> void:
	for node in EditorInterface.get_edited_scene_root().get_children():
		if node is Sprite2D:
			EditorInterface.edit_node(node)
			break
	var section := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:3")
	section.unfold()

func _has_changed_kitten_skew() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Sprite2D and node.name.to_lower() == "kitten" and node.skew > 0.0)

func _has_reset_kitten_skew() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Sprite2D and node.name.to_lower() == "kitten" and node.skew == 0.0)

func _has_changed_kitten_scale() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Sprite2D and node.name.to_lower() == "kitten" and node.scale == Vector2(0.5, 0.5))

func _has_changed_kitten_scale_again() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Sprite2D and node.name.to_lower() == "kitten" and node.scale != Vector2(0.5, 0.5))

func _has_moved_kitten() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Sprite2D and node.name.to_lower() == "kitten" and node.position.y > 100)

func _has_mirrored_kitten() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Sprite2D and node.name.to_lower() == "kitten" and node.flip_h)

func _unfold_sprite2d_properties() -> void:
	var section := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:0")
	section.unfold()

func _unfold_visibility_properties() -> void:
	var section := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:4")
	section.unfold()
	
func _has_hidden_kitten() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Sprite2D and node.name.to_lower() == "kitten" and not node.visible)

func _has_shown_kitten_and_modulated() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Sprite2D and node.name.to_lower() == "kitten" and node.visible and node.modulate.g < 0.9)

func _has_user_saved_scene() -> bool:
	return not EditorScript.new().get_scene().scene_file_path.is_empty()

func _is_select_main_scene_dialog_open() -> bool:
	if _is_game_playing():
		return true # confirmation dialog could be skipped if not first time
	var dialog := EditorSpy.alternative_path_to_node("Panel:0/ConfirmationDialog:9")
	if dialog != null and dialog is Window and dialog.visible:
		var tween = EditorInterface.get_base_control().create_tween()
		tween.tween_property(dialog, "position", Vector2i(dialog.position.x, 0), 0.3)
		return true
	return false

func _is_game_playing() -> bool:
	return EditorInterface.is_playing_scene()

func _has_game_stopped_playing() -> bool:
	return not EditorInterface.is_playing_scene()

func _has_added_camera2d_node() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().filter(func(node): return node is Camera2D).size() == 1

func _has_moved_camera() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Camera2D and node.position.y > 0)

func _has_rotated_camera() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Camera2D and not node.ignore_rotation and node.rotation != 0.0)

func _has_un_rotated_camera() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Camera2D and node.ignore_rotation and node.rotation == 0.0)

func _copy_movement_script_resource():
	_move_resource_panel_split_up()
	
	var file_system := EditorInterface.get_resource_filesystem().get_filesystem()
	for i in file_system.get_file_count():
		print(file_system.get_file(i))
		if file_system.get_file(i) == "keyboard_movement.gd":
			print("Movement script resource already exists")
			return
	var dir := DirAccess.open(file_system.get_path())
	dir.copy("addons/igt/topics/basics/keyboard_movement.gd", "keyboard_movement.gd")
	print("Copied movement script")
	EditorInterface.get_resource_filesystem().scan()

func _has_attached_script() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Sprite2D and node.name.to_lower() == "kitten" and node.get_script() != null)

func _camera_child_of_kitten() -> bool:
	return EditorInterface.get_edited_scene_root().get_children().any(func(node: Node): return node is Sprite2D and node.name.to_lower() == "kitten" and node.get_children().size() == 1 and node.get_children()[0] is Camera2D)

func _unfold_camera_drag_properties() -> void:
	var section := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:3")
	section.unfold()

func _has_changed_camera_zoom() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Camera2D and node.zoom == Vector2(2.0, 2.0))

func _has_changed_camera_drag() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Camera2D and node.drag_horizontal_enabled and node.drag_vertical_enabled)

func _unfold_camera_smoothing_properties() -> void:
	var section := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:1")
	section.unfold()

func _has_changed_camera_smoothing() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Camera2D and node.position_smoothing_enabled and node.position_smoothing_speed < 2.0)

func _unfold_camera_limit_properties() -> void:
	var section := EditorSpy.alternative_path_to_node("Panel:0/VBoxContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/HSplitContainer:0/VSplitContainer:0/TabContainer:0/InspectorDock:0/EditorInspector:0/VBoxContainer:0/EditorInspectorSection:0")
	section.unfold()
	
func _has_changed_camera_limit() -> bool:
	return EditorSpy.get_children_recursive(EditorInterface.get_edited_scene_root()).any(func(node): return node is Camera2D and not node.position_smoothing_enabled and not node.drag_horizontal_enabled and not node.drag_vertical_enabled and node.limit_bottom == 350)

