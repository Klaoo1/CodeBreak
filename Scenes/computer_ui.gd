extends Control

@onready var ui_manager = get_parent()

@export var computer_id: String

func _process(_delta):
	if visible and Input.is_action_just_pressed("ui_cancel"):
		ui_manager.close_computer()

func _on_exit_button_pressed():
	ui_manager.close_computer()

func _on_start_button_pressed():
	GameState.return_scene_path = get_tree().current_scene.scene_file_path
	GameState.quiz_room = ui_manager.get_current_room()

	print("QUIZ ROOM SET TO:", GameState.quiz_room)

	get_tree().change_scene_to_file("res://Scenes/ChallengeScreen.tscn")
