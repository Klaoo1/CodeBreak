extends CanvasLayer

@onready var computer_ui = $ComputerUI

var ui_open := false
var current_computer_id := ""

func open_computer(id):
	current_computer_id = id
	print("OPEN COMPUTER CALLED:", id)

	computer_ui.show()
	ui_open = true

	update_terminal_text()
	print("CURRENT COMPUTER ID:", current_computer_id)
	
func close_computer():
	computer_ui.hide()
	ui_open = false
	current_computer_id = ""

func update_terminal_text():
	if current_computer_id == "room1":
		$ComputerUI/Panel/TitleLabel.text = "ROOM 1 TERMINAL"
		$ComputerUI/Panel/InfoLabel.text = "Complete 5 Questions to unlock the exit door."

	elif current_computer_id == "room2":
		$ComputerUI/Panel/TitleLabel.text = "ROOM 2 TERMINAL"
		$ComputerUI/Panel/InfoLabel.text = "Complete 5 Questions to unlock the next door."

func get_current_room():
	return current_computer_id
