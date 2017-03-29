extends RigidBody2D

var flame
var animPlayer
var animName
var maxTurnVelocity = 5
var velocityInc = 5
var shot = false

var throttleButton
var leftButton
var rightButton
var fireButton

var bullet
var bullet_speed = 500

func _ready():
	bullet = preload("res://Bullet.tscn")
	flame = get_node("ShipBody/flame")
	flame.hide()    
	animPlayer = get_node("ShipBody/flame/AnimationPlayer")                                
	
	set_process(true)
	set_fixed_process(true)
	print(Input.get_joy_name(0))
	print(Input.get_joy_name(1))
	print(Input.get_joy_name(2))

func _process(delta):
	if(Input.is_key_pressed(throttleButton)):
		if(!animPlayer.is_playing()):
			animPlayer.play(animName)
			flame.show()
	else:
		animPlayer.stop()
		flame.hide()

func _fixed_process(delta):
	var velocity = get_angular_velocity()
	var inc = velocityInc
	
	if(Input.is_key_pressed(fireButton)):
		if(shot == false):
			var newBullet = bullet.instance()
			get_parent().add_child(newBullet)
			newBullet.set_rotd(get_rotd())
			newBullet.add_collision_exception_with(self)
			newBullet.set_pos(get_node("Nose").get_global_pos())
			newBullet.set_linear_velocity(-newBullet.get_global_transform().y*bullet_speed)
			shot = true
	else:
		shot = false
	
	if(Input.is_key_pressed(leftButton)):
		if(velocity > -maxTurnVelocity):
			if(velocity > 0):
				inc *= 2
				
			set_angular_velocity(velocity-inc*delta)
	if(Input.is_key_pressed(rightButton)):
		if(velocity < maxTurnVelocity):
			if(velocity < 0):
				inc *= 2
				
			set_angular_velocity(velocity+inc*delta)
	
	if(Input.is_key_pressed(throttleButton)):
		apply_impulse(Vector2(0,0),-get_global_transform().y)