extends KinematicBody2D

var speed : int = 1100
var jump_speed : int = 1100
var gravity : int = 800
var velocity = Vector2()


func get_input(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		$AnimatedSprite.play("Walk")
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		$AnimatedSprite.play("Walk");
		
	if Input.is_action_pressed("jump"):
		if (is_on_floor()):
			velocity.y -= jump_speed
			$AnimatedSprite.play("Jump");
	else:
		$AnimatedSprite.play("Idle");
		



	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	pass

func _physics_process(delta):
	get_input(delta)
