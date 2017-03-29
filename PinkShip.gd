extends "res://Ship.gd"

func _ready():
	._ready()
	
	animName = "FlameFlicker(pink)"                                
	throttleButton = KEY_UP
	leftButton = KEY_LEFT
	rightButton = KEY_RIGHT
	fireButton = KEY_SPACE