class_name Ship extends KinematicBody2D


var velocity := Vector2.ZERO;
const MAX_SPEED = 400 # per second
const ACCEL = 1000
const FRICTION = 1000


signal fire

var Projectile = preload("res://objects/projectile.tscn")

var shot_ready := false
const shot_delay := 0.33
onready var shot_timer := $Timer

export(int) var health := 10


# Called when the node enters the scene tree for the first time.
func _ready():
	shot_timer.connect("timeout", self, "reset_shot")
	reset_shot()
	pass # Replace with function body.


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");
	input_vector = input_vector.normalized()
	
	if (input_vector != Vector2.ZERO):
		#aniTree.set("parameters/Idle/blend_position", input_vector)
		#aniTree.set("parameters/Run/blend_position", input_vector)
		#aniState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCEL * delta)
	else:
		#aniState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	velocity = move_and_slide(velocity)
	
func _input(event):
	if event.is_action("ui_select") :
		fire()

func fire() :
	if (shot_ready):
		shot_ready = false
		
		var bullet = Projectile.instance()
		bullet.position = $Front.global_position
		bullet.linear_velocity = Vector2(100,0)
		bullet.add_central_force(Vector2(100,0)) #Play with velocity here
		bullet.add_to_group("bullets")
		self.get_parent().add_child(bullet)
		
		emit_signal("fire")

func reset_shot() :
	shot_ready = true
	shot_timer.start(shot_delay)
	shot_timer.set_paused(false)
