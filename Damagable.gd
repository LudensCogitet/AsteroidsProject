extends RigidBody2D

var health

func _ready():
	set_max_contacts_reported(5)
	set_contact_monitor(true)

func _integrate_forces(state):
	var bodies = get_colliding_bodies()
	if(bodies.size() > 0):
		var damage = 0
		var mylv = get_linear_velocity()
		 
		for i in bodies:
			if(i extends RigidBody2D):
				var damageVector = mylv - i.get_linear_velocity();
				var vx = abs(damageVector.x)
				var vy = abs(damageVector.y)
				damage += sqrt(vx*vx+vy*vy)
		health -= damage