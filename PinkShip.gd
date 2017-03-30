extends "res://Ship.gd"

func _ready():
	._ready()
	               
	throttleButton = "P2_throttle"
	leftButton = "P2_left"
	rightButton = "P2_right"
	fireButton = "P2_fire"
	set_process(true)
		
func _process(delta):
	if(Input.is_action_pressed(throttleButton)):
		flame.show()
	else:
		flame.hide()