@tool
extends Control
class_name IGTMain

@onready var title_label: Label = $MainMenu/VBox/Label
@onready var authoring_page_button: Button = $MainMenu/VBox/AuthoringPageButton
@onready var back_button: Button = $BackButton

@export var flying_logos := 20
@onready var flying_logo_scene := preload("res://addons/igt/flying_logo.tscn")
@onready var tutorial_buttons_vbox : VBoxContainer = $MainMenu/VBox/VBox

enum Page {
	MAIN_MENU,
	AUTHORING_TOOL,
	TUTORIAL
}
var page := Page.MAIN_MENU

var tutorials : Array[Topic] = [
	preload("res://addons/igt/topics/basics/NodesAndScenes.gd").new(),
	preload("res://addons/igt/topics/basics/Basic2dNodes.gd").new(),
	preload("res://addons/igt/topics/basics/ScriptingBasics.gd").new(),
	preload("res://addons/igt/topics/basics/SoundAndMusic.gd").new()
]

func _ready():
	for topic in tutorials:
		var button := Button.new()
		button.text = topic.title
		button.pressed.connect(_on_topic_button_pressed.bind(topic))
		tutorial_buttons_vbox.add_child(button)
	
	for i in flying_logos:
		var logo := flying_logo_scene.instantiate()
		$MainMenu/SubViewportContainer/SubViewport.add_child(logo)
		
	print("Igt> Loaded tutorial view")

func set_page(new_page: IGTMain.Page):
	if page == new_page:
		return
	page = new_page
	$MainMenu.visible = (page == Page.MAIN_MENU)
	$BackButton.visible = (page != Page.MAIN_MENU)
	$AuthoringPage.visible = (page == Page.AUTHORING_TOOL)
	$TutorialPage.visible = (page == Page.TUTORIAL)
	$Godette.visible = (page == Page.MAIN_MENU)

func _on_back_button_pressed():
	set_page(Page.MAIN_MENU)

func _on_authoring_page_button_pressed():
	set_page(Page.AUTHORING_TOOL)

func _on_topic_button_pressed(topic: Topic):
	set_page(Page.TUTORIAL)
	$TutorialPage.topic = topic

func _on_tutorial_page_done_clicked():
	set_page(Page.MAIN_MENU)
	EditorInterface.set_main_screen_editor("Tutorial")
