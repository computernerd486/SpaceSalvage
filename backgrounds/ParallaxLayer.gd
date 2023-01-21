extends ParallaxLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(float) var SPEED = -30

func _process(delta):
	self.motion_offset.x += SPEED * delta
