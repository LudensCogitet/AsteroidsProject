extends Particles2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var planets = []
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	planets.append(preload("res://BackgroundPlanet1.png"))
	planets.append(preload("res://BackgroundPlanet2.png"))
	planets.append(preload("res://BackgroundPlanet3.png"))
	
	get_node("Timer").connect("timeout",self,"_timer_timeout")
	set_process(true)

func _process(delta):
	print(get_node("Timer").get_time_left())

func _timer_timeout():
	var newTime = rand_range(100,300)
	get_node("Timer").set_wait_time(newTime)
	set_lifetime(newTime)
	reset()
	set_texture(planets[int(rand_range(0,planets.size()))])