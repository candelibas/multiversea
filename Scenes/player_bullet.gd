extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var vel= Vector2()
export var speed=1000

func _ready():
	set_fixed_process(true)

func start_at(dir, pos):
	set_rot(dir)
	set_pos(pos)
	vel = Vector2(speed,0).rotated(dir)
func _fixed_process(delta):
	set_pos(get_pos() + vel * delta)
