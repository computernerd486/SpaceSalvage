extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var exploding : = false
var state_machine
onready var ani_player : = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	#state_machine = $AnimationTree.get("parameters/playback")
	self.connect("body_entered", self, "collsion")
	$VisibilityNotifier2D.connect("screen_exited", self, "queue_free")
	pass # Replace with function body.


# Handle the collsion, disabled and remove the collsion
func collsion(node) : 
	print(node)
	
	if node is Projectile:
		#state_machine.travel("Explode")
		ani_player.connect("animation_finished", self, "destroy")
		ani_player.play("Explode")
		$AudioStreamPlayer.play()
		$CollisionShape2D.queue_free()
		node.queue_free()
		
func destroy(ani) :
	print(ani)
	if (ani == "Explode") :
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
