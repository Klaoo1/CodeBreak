extends CharacterBody2D

const SPEED = 200.0

@onready var ui_manager = get_tree().current_scene.get_node_or_null("UIManager")

func _physics_process(_delta):

	if ui_manager and ui_manager.ui_open:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	velocity = direction.normalized() * SPEED
	move_and_slide()
