extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var asteroid := preload("res://objects/asteroid.tscn")
var position : Position2D
var v_height
var range_start = 30
var range_end

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	range_end = get_viewport().get_visible_rect().size.y
	
	self.connect("timeout", self, "_spawn")
	self.start()

func _spawn():
	print("spawn")
	var a := asteroid.instance()
	#.position = position
	#a.velocity = Vector2(-100, 0)
	a.position = Vector2(position.position.x, rng.randi_range(range_start, range_end))	
	a.linear_velocity = Vector2(-100,0)
	self.get_parent().add_child(a)
	
	print(a.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
