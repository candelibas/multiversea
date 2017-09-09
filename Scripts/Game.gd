extends Node

var npc_load = preload("res://Scenes/NPC.tscn")

func _ready():
	set_fixed_process(true)
	
	# Create starting npcs
	for i in range(5):
		var new_npc = npc_load.instance()
		new_npc.set_pos(Vector2(1200, rand_range(10, 500)))
		add_child(new_npc)
	
	
func _fixed_process(delta):
	