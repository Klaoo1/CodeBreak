extends Control

var questions = [
	{
		"question": "Access Terminal: What keyword defines a function in Python?",
		"answer": "def"
	},
	{
		"question": "Decrypt Log: What symbol starts a Python comment?",
		"answer": "#"
	},
	{
		"question": "System Check: Which function displays output in Python?",
		"answer": "print"
	},
	{
		"question": "Authentication: What value type can only be True or False?",
		"answer": "boolean"
	},
	{
		"question": "Firewall Override: Which loop runs while a condition remains true?",
		"answer": "while"
	}
]

var current_question = 0

@onready var progress_label = $Panel/ProgressLabel
@onready var question_label = $Panel/QuestionsLabel
@onready var answer_box = $Panel/AnswerBox


func _ready():
	print("QUIZ STATE ID:", GameState.get_instance_id())
	load_question()

func load_question():
	progress_label.text = "QUESTION %d/%d" % [current_question + 1, questions.size()]
	question_label.text = questions[current_question]["question"]
	answer_box.text = ""

func _on_submit_button_pressed() -> void:
	var player_answer = answer_box.text.strip_edges()

	if player_answer.to_lower() == questions[current_question]["answer"].to_lower():

		current_question += 1

		if current_question >= questions.size():

			question_label.text = "🎉 CHALLENGE COMPLETE!"
			progress_label.text = "COMPLETE"
			answer_box.hide()
			
			print("QUIZ ROOM =", GameState.quiz_room)
			
			if GameState.quiz_room == "room1":
				GameState.code_room_completed = true
				print("ROOM 1 COMPLETED")
			elif GameState.quiz_room == "room2":
				GameState.room2_completed = true
				print("ROOM 2 COMPLETED")
			elif GameState.quiz_room == "room3":
				GameState.room3_completed = true
				print("ROOM 3 COMPLETED")
			elif GameState.quiz_room == "final":
				GameState.final_room_completed = true
				print("FINAL ROOM COMPLETED")

				await get_tree().create_timer(2.0).timeout

				get_tree().change_scene_to_file("res://Scenes/Lobby.tscn")
				return

			await get_tree().create_timer(2.0).timeout

			get_tree().change_scene_to_file(GameState.return_scene_path)

		else:
			load_question()

	else:
		print("WRONG!")
		
		
func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file(GameState.return_scene_path)
