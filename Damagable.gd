extends RigidBody2D

var health
var maxHealth
var bulletDamageDivisor

func _ready():
	health = maxHealth
	set_max_contacts_reported(5)
	set_contact_monitor(true)

func takePhysicsDamage(body):
	var damage = 0
	var mylv = get_linear_velocity()
		 
	var damageVector = mylv - body.get_linear_velocity();
	var vx = abs(damageVector.x)
	var vy = abs(damageVector.y)
	damage += sqrt(vx*vx+vy*vy)
	health -= damage