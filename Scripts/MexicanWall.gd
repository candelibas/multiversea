extends Area2D

onready var health_bar = get_tree().get_root().get_node("world/healthbar")

func _ready():
	pass

func _on_mexican_wall_body_enter( body ):
	health_bar.set_value(health_bar.get_value() - 50)
	