extends "res://Asteroid.gd"

func _ready():
	._ready()
	health = 3000

func _integrate_forces(state):
	._integrate_forces(state)