extends Node

onready var npc_load = preload("res://Scenes/NPC.tscn")
var new_npc

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	# Spawn npcs
	# Create starting npcs
	for i in range(3):
		new_npc = npc_load.instance()
		new_npc.set_pos(Vector2(1200, rand_range(30, 500)))
		add_child(new_npc)