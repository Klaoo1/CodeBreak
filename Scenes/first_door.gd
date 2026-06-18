extends Node2D

func _ready():
	if GameState.code_room_completed:
		open_door()

func open_door():
	$Sprite2D.hide()
	$CollisionShape2D.disabled = true
