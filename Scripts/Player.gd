extends KinematicBody2D

onready var weapon = get_node("sprite/weapon_sprite") 
var mouse_position

func _ready():
	set_fixed_process(true)
	
	
func _fixed_process(delta):
	# mouse_position = get_viewport().get_mouse_pos()
	mouse_position = get_global_mouse_pos()
	#weapon.look_at(Vector2(mouse_position.x * 5, mouse_position.y * 5 ))
	weapon.look_at(mouse_position)
	
	#weapon.set_transform(mouse_position)
	
	# When character dies
	#die()
	
func die():
	weapon.translate(Vector2(1,1))