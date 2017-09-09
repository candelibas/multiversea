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
	vel = Vector2(speed,0).rotated(dir - PI/2)
func _fixed_process(delta):
	set_pos(get_pos() + vel * delta)


func _on_lifetime_timeout():
	queue_free()


func _on_player_bullet_body_enter( body ):
	if body.get_groups().has("npc"):
		body.destroy()
		Game.explosion(get_pos())
		queue_free()
