extends Node

var npc_load = preload("res://Scenes/NPC.tscn")
onready var sound = get_node("sound")
onready var timer = get_node("spawn_timer")
var timer_counter = 0

func _ready():
	sound.play("gameplay")
	# Create starting npcs
	timer.start()
	timer.set_wait_time(5 - timer_counter)
	
func spawn_npc():
	for i in range(5):
		var new_npc = npc_load.instance()
		new_npc.set_pos(Vector2(1200, rand_range(10, 500)))
		add_child(new_npc)

func _on_restart_button_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")

func _on_spawn_timer_timeout():
	timer_counter += 1
	spawn_npc()
