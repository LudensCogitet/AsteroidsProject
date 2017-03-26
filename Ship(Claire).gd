extends RigidBody2D

var flame
var flameAnim
var maxTurnVelocity = 5
var velocityInc = 5
var shot = false

var bullet
var bullet_speed = 500

func _ready():
	bullet = preload("res://Bullet(Claire).tscn")
	flame = get_node("ShipBody/flame")
	flameAnim = get_node("ShipBody/flame/AnimationPlayer")
	flame.hide()
	
	set_process(true)
	set_fixed_process(true)

func _process(delta):
	if(Input.is_key_pressed(KEY_UP)):
		if(!flameAnim.is_playing()):
			flameAnim.play("FlameFlicker")
			flame.show()
	else:
		flameAnim.stop()
		flame.hide()

func _fixed_process(delta):
	var velocity = get_angular_velocity()
	var inc = velocityInc
	
	if(Input.is_key_pressed(KEY_SPACE)):
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
	
	if(Input.is_key_pressed(KEY_LEFT)):
		if(velocity > -maxTurnVelocity):
			if(velocity > 0):
				inc *= 2
				
			set_angular_velocity(velocity-inc*delta)
	if(Input.is_key_pressed(KEY_RIGHT)):
		if(velocity < maxTurnVelocity):
			if(velocity < 0):
				inc *= 2
				
			set_angular_velocity(velocity+inc*delta)
	
	if(Input.is_key_pressed(KEY_UP)):
		apply_impulse(Vector2(0,0),-get_global_transform().y)