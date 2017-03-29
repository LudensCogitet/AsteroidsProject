extends "res://Asteroid.gd"

var SmallAsteroid

func _ready():
	._ready()
	SmallAsteroid = preload("res://SmallAsteroid.tscn")
	health = 1000

func _integrate_forces(state):
	._integrate_forces(state)
	if(health < 0):
		var multi = 50
		var newAsteroid = SmallAsteroid.instance()
		get_parent().add_child(newAsteroid)
		newAsteroid.set_pos(Vector2(100,100))
		newAsteroid.apply_impulse(newAsteroid.get_pos(),Vector2(rand_range(-1,1)*multi,rand_range(-1,1)*multi))
		queue_free()