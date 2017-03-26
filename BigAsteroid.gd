extends "res://Asteroid.gd"

func _ready():
	._ready()
	health = 10000
	print("big UN")

func _integrate_forces(state):
	._integrate_forces(state)
	print(health)