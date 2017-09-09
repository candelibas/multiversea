extends Node

func _on_play_button_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")

func _on_about_button_pressed():
	get_tree().change_scene("res://Scenes/About.tscn")
