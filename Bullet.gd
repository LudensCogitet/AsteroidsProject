extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var die = false
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_max_contacts_reported(1)
	set_contact_monitor(true)

func _integrate_forces(state):
	if(die == true):
		queue_free()
		return
		
	if(state.get_contact_count() > 0):
		if(state.get_contact_collider_object(0) extends load("res://Asteroid.gd")):
			print(round(state.get_contact_collider_object(0).health))
		die = true 
	