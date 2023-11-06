extends Node

#Tranzitia intre scene

func _ready():
	load_main_menu()

func load_main_menu():
	get_node("MainMenu/Margin/VBoxContainer/Play").connect("pressed",self,"on_play_pressed")
	get_node("MainMenu/Margin/VBoxContainer/Credits").connect("pressed",self,"on_credits_pressed")
	get_node("MainMenu/Margin/VBoxContainer/Settings").connect("pressed",self,"on_settings_pressed")
	get_node("MainMenu/Margin/VBoxContainer/Exit").connect("pressed",self,"on_exit_pressed")
	
func on_play_pressed():
	get_node("MainMenu").queue_free()
	var level_scene = load("res://Scenes/UIscenes/LevelSelector.tscn").instance()
	##game_scene.connect("game_finished", self, 'unload_game')
	add_child(level_scene)
	get_node("LevelSelector/Margin/VBoxContainer/Level 1").connect("pressed", self, "on_level1_pressed")
	get_node("LevelSelector/Margin/VBoxContainer/Level 2").connect("pressed", self, "on_level2_pressed")

func on_level1_pressed():
	get_node("LevelSelector").queue_free()
	var game_scene = load("res://Scenes/MainScene/GameScene.tscn").instance()
	game_scene.connect("game_finished", self, 'unload_game1')
	add_child(game_scene)
	
func on_level2_pressed():
	get_node("LevelSelector").queue_free()
	var game_scene = load("res://Scenes/MainScene/GameScene2.tscn").instance()
	game_scene.connect("game_finished", self, 'unload_game2')
	add_child(game_scene)
	
func on_credits_pressed():
	get_node("MainMenu").queue_free()
	var credits_scene = load("res://Scenes/MainScene/Credits.tscn").instance()
	add_child(credits_scene)
	get_node("Credits/Margin/Return").connect("pressed", self, "on_return_pressedc")
	
func on_settings_pressed():
	get_node("MainMenu").queue_free()
	var settings_scene = load("res://Scenes/MainScene/Settings.tscn").instance()
	add_child(settings_scene)
	get_node("Settings/Margin/Return").connect("pressed", self, "on_return_presseds")
	
func on_return_presseds():
	get_node("Settings").queue_free()
	var main_scene = load("res://Scenes/UIscenes/MainMenu.tscn").instance()
	add_child(main_scene)
	load_main_menu()


func on_return_pressedc():
	get_node("Credits").queue_free()
	var main_scene = load("res://Scenes/UIscenes/MainMenu.tscn").instance()
	add_child(main_scene)
	load_main_menu()
	
	
func on_exit_pressed():
	get_tree().quit()

func unload_game1(result):
	get_node("GameScene").queue_free()
	var main_menu = load("res://Scenes/UIscenes/MainMenu.tscn").instance()
	add_child(main_menu)
	load_main_menu()
	
func unload_game2(result):
	get_node("GameScene2").queue_free()
	var main_menu = load("res://Scenes/UIscenes/MainMenu.tscn").instance()
	add_child(main_menu)
	load_main_menu()
