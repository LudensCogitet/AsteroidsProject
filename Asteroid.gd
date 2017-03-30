extends "res://Damagable.gd"

var TYPE = "Asteroid"

func _ready():
	._ready()
	
	set_angular_velocity(rand_range(-1,1))

func _integrate_forces(state):
	var colliders = get_colliding_bodies()
	
	for i in colliders:
		if(i extends RigidBody2D):
			if(i.TYPE == "Bullet"):
				health = health - maxHealth/bulletDamageDivisor
				print(maxHealth/bulletDamageDivisor)
			else:
				takePhysicsDamage(i)
	
	if(health < 0):
		 get_parent().get_node("SoundPlayer").play("explosion")