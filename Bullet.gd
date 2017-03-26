extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_max_contacts_reported(1)
	set_contact_monitor(true)
	set_process(true)

func _process(delta):
	var collision = get_colliding_bodies()
	if(collision.size() > 0):
		get_node("Sprite").hide()
		queue_free()