extends Area2D

var vel = Vector2()
export var speed = 1000
onready var lod = preload("res://Scenes/Game.tscn")
var nbr
var score
func _ready():
	
	nbr = lod.instance()
	score = get_tree().get_root().get_node("world/label_score")
	
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
	#print(body.get_groups())
	if body.get_groups().has("npc"):
		body.destroy()
		Global.explosion(get_pos())
		var tempScore = str(int(score.get_text())+1)
		#tempScore+1
		
		score.set_text(tempScore)
		queue_free()
	if body.get_name()=="mexican_wall":
		vel=vel/2
