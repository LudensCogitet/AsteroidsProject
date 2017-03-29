extends "res://Ship.gd"

func _ready():
	._ready()
	animName = "FlameFlicker(yellow)"
	throttleButton = KEY_W
	leftButton = KEY_A
	rightButton = KEY_D
	fireButton = KEY_S