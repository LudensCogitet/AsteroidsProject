extends "res://Asteroid.gd"

var SUB_TYPE = "Big"

var SmallAsteroid
func _ready():
	maxHealth = 8000
	bulletDamageDivisor = 8
	._ready()
	SmallAsteroid = preload("res://SmallAsteroid.tscn")

func _integrate_forces(state):
	._integrate_forces(state)
	if(health < 0):
		var newAsteroid = SmallAsteroid.instance()
		
		var multi = 500
		var myPos = get_pos()
		var aSize = newAsteroid.get_node("Sprite").get_texture().get_size()
		var negOffsetX = myPos.x - aSize.x - 1
		var posOffsetX = myPos.x + aSize.x + 1
		var negOffsetY = myPos.y - aSize.y - 1
		var posOffsetY = myPos.y + aSize.y + 1
		
		var offsetVectors = [Vector2(negOffsetX,negOffsetY),Vector2(negOffsetX,posOffsetY),Vector2(posOffsetX,posOffsetY),Vector2(posOffsetX,negOffsetY)];
		
		newAsteroid.add_collision_exception_with(self)
		get_parent().add_child(newAsteroid)
		newAsteroid.set_pos(offsetVectors[0])
		newAsteroid.set_linear_velocity(get_linear_velocity())
		newAsteroid.apply_impulse(newAsteroid.get_pos(),Vector2(rand_range(-1,1)*multi,rand_range(-1,1)*multi))
		
		for i in range(1,4):
			newAsteroid = SmallAsteroid.instance()
			newAsteroid.add_collision_exception_with(self)
			get_parent().add_child(newAsteroid)
			newAsteroid.set_pos(offsetVectors[i])
			newAsteroid.set_linear_velocity(get_linear_velocity())
			newAsteroid.apply_impulse(newAsteroid.get_pos(),Vector2(rand_range(-1,1)*multi,rand_range(-1,1)*multi))
			
		queue_free()