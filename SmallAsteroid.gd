extends "res://Asteroid.gd"

var SUB_TYPE = "Small"

func _ready():
	maxHealth = 4000
	bulletDamageDivisor = 4
	._ready()
	
	

func _integrate_forces(state):
	._integrate_forces(state)
	if(health < 0):
		queue_free()