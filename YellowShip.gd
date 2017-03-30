extends "res://Ship.gd"

func _ready():
	._ready()
	throttleButton = "P1_throttle"
	leftButton = "P1_left"
	rightButton = "P1_right"
	fireButton = "P1_fire"
	set_process(true)
	
func _process(delta):
	if(Input.is_action_pressed(throttleButton)):
		flame.show()
	else:
		flame.hide()