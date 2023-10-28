@tool
extends Topic

func _init():
	super("GDScript code (UNDER CONSTRUCTION)", [
#		TutorialStep.new("Inleiding", 
#			"Hoi!  In dit onderwerp gaan we leren de basis van GDScript, de code waarmee je je spel tot leven brengt.\n\nDruk op de 'Volgende' knop om verder te gaan.",
#			null, _show_2D_editor),
#		TutorialStep.new("Scene maken", 
#			"Voor deze oefening hebben we een scene nodig.\n\nMaak eerst een nieuwe scene, met '2D Scene' als root node.",
#			null, Callable(),
#			"", true,
#			_has_empty_2d_scene),

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

