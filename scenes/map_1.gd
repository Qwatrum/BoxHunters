extends Node2D

@export var start_pos = Vector2()
@export var enemy_amount = 0
@export var golden_box_amount = 0

var player = preload("res://scenes/player.tscn")
var enemy = preload("res://scenes/enemy.tscn")
var golden_box = preload("res://scenes/golden_box.tscn")

var boxes_chaught = 0

var enemies = []
var golden_boxes = []

func _ready():
	
	var inste_player = player.instantiate()
	add_child(inste_player)
	inste_player.position = start_pos

func create_enemies():
	
	for i in range(enemy_amount):
		var inste = enemy.instantiate()
		add_child(inste)
		enemies.append(inste)

func create_golden_boxes():
	
	for i in range(golden_box_amount):
		var inste = golden_box.instantiate()
		add_child(inste)
		golden_boxes.append(inste)

func box_caught():
	
	boxes_chaught += 1
	if boxes_chaught >= golden_box_amount:
		print("You won")
		
func player_caught():
	
	print("You loose")
