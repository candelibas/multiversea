extends KinematicBody2D

var vel = Vector2()
var rot_speed
onready var sound = get_tree().get_root().get_node("world/sound")

func _ready():
	#add npc tag to all enemies
	add_to_group("npc")
	
	randomize()
	set_fixed_process(true)
	
	vel = Vector2(rand_range(-30, -50), 0)
	rot_speed = rand_range(-0.2, 0.2)
	
func _fixed_process(delta):
	set_rot(get_rot() + rot_speed)
	move(vel * delta)
	
	#if is_colliding():
		
		#self.queue_free()
func destroy():
	sound.play("explosion")
	queue_free()
	