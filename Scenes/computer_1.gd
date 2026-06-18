extends Area2D

var player_inside := false

@onready var ui = get_tree().current_scene.get_node("UIManager")
@export var computer_id: String

func _ready():
	print("Computer script loaded")

	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		print("E PRESSED")
		print("player_inside =", player_inside)

	if player_inside and Input.is_action_just_pressed("interact"):
		print("OPENING COMPUTER")
		ui.open_computer(computer_id)
		
func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false


func _on_start_button_pressed() -> void:
	pass # Replace with function body.
