extends CharacterBody2D

var SPEED = 200.0

func _physics_process(delta):
	
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 25)
		
	var direction_up = Input.get_axis("up", "down")
	
	if direction_up:
		velocity.y = direction_up * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, 25)
	
	move_and_slide()
