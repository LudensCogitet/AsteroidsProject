extends "res://Damagable.gd"

func _ready():
	._ready()
	set_angular_velocity(rand_range(-1,1))

func _integrate_forces(state):
	._integrate_forces(state)
	
	if(health < 0):
		queue_free()