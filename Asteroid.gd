extends "res://Damagable.gd"

func _ready():
	health = 1000
	set_angular_velocity(rand_range(-1,1))
	set_max_contacts_reported(5)
	set_contact_monitor(true)

func _integrate_forces(state):
	._integrate_forces(state)
	
	if(health < 0):
		queue_free()