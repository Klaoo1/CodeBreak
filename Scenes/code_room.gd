extends Node2D

var player_scene = preload("res://Scenes/Player.tscn")

@onready var wall_layer = get_node("WallLayer")

var door_opened := false

func _ready():
	var player = player_scene.instantiate()
	add_child(player)

	var spawn = $SpawnPoint
	player.global_position = spawn.global_position

	call_deferred("check_door")
	
	print("CODE ROOM COMPLETED =", GameState.code_room_completed)
	print("ROOM STATE ID:", GameState.get_instance_id())
	
func check_door():
	print("Door 1:", GameState.code_room_completed)
	print("Door 2:", GameState.room2_completed)
	print("Door 3:", GameState.room3_completed)
	
	
	if GameState.code_room_completed:
		open_door1()

	if GameState.room2_completed:
		open_door2()
		
	if GameState.room3_completed:
		open_door3()

func open_door1():
	print("OPEN DOOR CALLED")
	for x in range(14, 17):
		for y in range(17, 21):
			wall_layer.set_cell(Vector2i(x, y), -1)

func open_door2():
	print("OPEN DOOR 2")

	for y in range(32, 35):
		wall_layer.set_cell(Vector2i(24, y), -1)

func open_door3():
	print("OPEN DOOR 3")

	for x in range(36, 39):
		for y in range(22, 26):
			wall_layer.set_cell(Vector2i(x, y), -1)
