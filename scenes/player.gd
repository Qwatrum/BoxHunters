extends CharacterBody2D

var SPEED = 400.0

func _ready():
	$"win".hide()
	$"loose".hide()
	$"Back".hide()

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

func win():
	$"win".show()
	$"Back".show()
func loose():
	SPEED = 0
	$"Back".show()
	$"loose".show()


func _on_back_button_down():
	get_tree().change_scene_to_file("res://scenes/map_menu.tscn")
