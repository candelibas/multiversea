extends KinematicBody2D

onready var health_bar = get_tree().get_root().get_node("world/healthbar")

func _ready():
	add_to_group("wall")
	pass



func _on_wall_body_enter( body ):
	if body.get_groups().has("npc"):
		health_bar.set_value(health_bar.get_value() - 50)
	pass # replace with function body
