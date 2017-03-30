extends "res://Damagable.gd"

var TYPE = "Ship"

var maxTurnVelocity = 5
var velocityInc = 5
var shot = false

var startPos

onready var flame = get_node("ShipBody/flame")

var throttleButton
var leftButton
var rightButton
var fireButton

var bullet
var bullet_speed = 500

func _ready():
	startPos = get_pos()
	maxHealth = 2000
	bulletDamageDivisor = 1
	._ready()
	
	bullet = preload("res://Bullet.tscn")                         
	
	set_fixed_process(true)
	print(Input.get_joy_name(0))
	print(Input.get_joy_name(1))
	print(Input.get_joy_name(2))

func _integrate_forces(state):
	var colliders = get_colliding_bodies()
	
	for i in colliders:
		if(i extends RigidBody2D):
			if(i.TYPE == "Bullet"):
				health = health - maxHealth/bulletDamageDivisor
			else:
				takePhysicsDamage(i)
	if(health < 0):
		get_node("AnimationPlayer").play("Flash")

func _fixed_process(delta):
	if(health < 0):
		get_parent().get_node("SoundPlayer").play("explosion")
		set_linear_velocity(Vector2(0,0))
		set_pos(startPos)
		health = maxHealth
		
	var velocity = get_angular_velocity()
	var inc = velocityInc
	
	if(Input.is_action_pressed(fireButton)):
		if(shot == false):
			get_parent().get_node("SoundPlayer").play("laser")
			var newBullet = bullet.instance()
			get_parent().add_child(newBullet)
			newBullet.set_rotd(get_rotd())
			newBullet.add_collision_exception_with(self)
			newBullet.set_pos(get_node("Nose").get_global_pos())
			newBullet.set_linear_velocity(-newBullet.get_global_transform().y*bullet_speed)
			shot = true
	else:
		shot = false
	
	if(Input.is_action_pressed(leftButton)):
		if(velocity > -maxTurnVelocity):
			if(velocity > 0):
				inc *= 2
				
			set_angular_velocity(velocity-inc*delta)
	if(Input.is_action_pressed(rightButton)):
		if(velocity < maxTurnVelocity):
			if(velocity < 0):
				inc *= 2
				
			set_angular_velocity(velocity+inc*delta)
	
	if(Input.is_action_pressed(throttleButton)):
		apply_impulse(Vector2(0,0),-get_global_transform().y)