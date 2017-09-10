extends Node

onready var explosion = preload("res://Scenes/Explosion.tscn")
var expl

func explosion(pos):
	expl = explosion.instance()
	add_child(expl)
	expl.set_pos(pos)
	expl.play()