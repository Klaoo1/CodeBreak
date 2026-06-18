extends Node2D

var player_scene = preload("res://Scenes/Player.tscn")

func _ready():
	var player = player_scene.instantiate()
	add_child(player)

	var spawn = $SpawnPoint
	player.global_position = spawn.global_position
