class_name Projectile extends RigidBody2D

#Self Cleanup, if we go outside the screen, just delete me
func _ready():
	$visability.connect("screen_exited", self, "queue_free")
