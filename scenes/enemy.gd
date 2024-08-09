extends CharacterBody2D

@onready var main := get_parent()
@onready var tilemap := main.get_node("Level")

var direction = 0
var SPEED = 900.0

func _ready():
	position = get_random_valid_position()

func _process(delta):
	if SPEED != 0:
		if get_player_pos().distance_to(position) <= 37:
			main.player_caught()
		
		if velocity == Vector2(0, 0):
			direction = randi_range(0, 3)
		
		if direction == 0:
			velocity.x = 0
			velocity.y = -SPEED
		elif direction == 1:
			velocity.x = SPEED
			velocity.y = 0
		elif direction == 2:
			velocity.x = 0
			velocity.y = SPEED
		elif direction == 3:
			velocity.x = -SPEED
			velocity.y = 0
		
		move_and_slide()

func get_random_valid_position():
	var pos = Vector2()
	while true:
		pos = Vector2(randi_range(35, 1110), randi_range(35, 600))
		var clicked_cell = tilemap.local_to_map(pos)
		var data = tilemap.get_cell_tile_data(0, clicked_cell)
		if not data:
			break
	return pos

func get_player_pos():
	return main.player_pos()
