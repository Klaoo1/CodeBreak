extends Area2D

var player_inside = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://Scenes/CodeRoom.tscn")
