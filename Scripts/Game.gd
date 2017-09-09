extends Node

var npc_load = preload("res://Scenes/NPC.tscn")
onready var explosion = preload("res://Scenes/Explosion.tscn")
var expl
func _ready():
	
	# Create starting npcs
	for i in range(5):
		var new_npc = npc_load.instance()
		new_npc.set_pos(Vector2(1200, rand_range(10, 500)))
		add_child(new_npc)


func _on_Button_pressed():
	get_tree().set_pause(true)

func explosion(pos):
	expl = explosion.instance()
	add_child(expl)
	expl.set_pos(pos)
	expl.play()
