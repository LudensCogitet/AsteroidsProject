extends Node2D

var smallAsteroid
var bigAsteroid

func _ready():
	smallAsteroid = preload("res://SmallAsteroid.tscn")
	bigAsteroid = preload("res://BigAsteroid.tscn")
	var multi = 20
	randomize()
	for i in range(int(rand_range(5,20))):
		var newInstance = bigAsteroid.instance()
			
		var xBuffer = newInstance.get_node("Sprite").get_texture().get_size().x + 5
		var yBuffer = newInstance.get_node("Sprite").get_texture().get_size().y + 5
		
		var newPos = Vector2(rand_range(xBuffer,get_viewport().get_rect().size.width-xBuffer),rand_range(yBuffer,get_viewport().get_rect().size.height-yBuffer))
		add_child(newInstance)
		newInstance.set_pos(newPos)
		newInstance.apply_impulse(newPos,Vector2(rand_range(-1*multi,1*multi),rand_range(-1*multi,1*multi)))