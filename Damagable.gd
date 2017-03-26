extends RigidBody2D

var health

func _ready():
	pass

func _integrate_forces(state):
	var bodies = get_colliding_bodies()
	if(bodies.size() > 0):
		var damage = 0
		var lv = get_linear_velocity()
		var vx = abs(lv.x)
		var vy = abs(lv.y)
		damage += sqrt(vx*vx + vy*vy) 
		for i in bodies:
			if(i extends RigidBody2D):
				lv = i.get_linear_velocity()
				vx = abs(lv.x)
				vy = abs(lv.y)
				damage += sqrt(abs(lv.x)*abs(lv.x)+abs(lv.y))
		health -= damage