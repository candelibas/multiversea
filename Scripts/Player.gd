extends KinematicBody2D

onready var health_bar = get_tree().get_root().get_node("world/healthbar")
onready var restart_btn = get_tree().get_root().get_node("world/restart_button")
onready var weapon = get_node("weapon_sprite") 
var mouse_position

onready var bullet = preload("res://Scenes/PlayerBullet.tscn")
onready var bullet_container = get_node("bullet_container")
onready var gun_timer = get_node("gun_timer")

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	mouse_position = get_global_mouse_pos()
	#weapon.set_rot(weapon.get_pos().angle_to_point(mouse_position)+PI/2)
	weapon.look_at(mouse_position)
	
	# Check if character dies
	if health_bar.get_value() == 0:
		set_process_input(false)
		die()
	else: # If not dead yet, shoot!
		if Input.is_action_pressed("player_shoot"):
			if gun_timer.get_time_left() == 0:
				shoot()
	
func shoot():
	gun_timer.start()
	var b = bullet.instance()
	bullet_container.add_child(b)
	b.start_at(weapon.get_rot(),get_node("weapon_sprite/Position2D").get_global_pos())

# You are die
func die():
	restart_btn.show()
	self.translate(Vector2(1.5, -1.5))
	self.rotate(0.01)
	weapon.translate(Vector2(1,1))
	weapon.rotate(-0.01)