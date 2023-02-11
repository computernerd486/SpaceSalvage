extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var shot_timer : = $shot_timer

var Projectile = preload("res://objects/enemy_projectile.tscn")

const shot_speed = -100

# Called when the node enters the scene tree for the first time.
func _ready():
	shot_timer.connect("timeout", self, "_fire")

func _fire():
	var bullet = Projectile.instance()
	bullet.position = $Front.global_position
	bullet.linear_velocity = Vector2(shot_speed,0)
	bullet.add_central_force(Vector2(shot_speed,0)) #Play with velocity here
	bullet.add_to_group("enemy_bullets")
	self.get_parent().add_child(bullet)
