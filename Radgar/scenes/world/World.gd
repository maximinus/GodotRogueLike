extends Node2D

const SQUARE_SIZE = 32

func _ready():
	pass

func _process(delta):
	var move_delta = Vector2(0, 0)
	if Input.is_action_just_pressed('ui_up'):
		move_delta.y -= SQUARE_SIZE
	if Input.is_action_just_pressed('ui_down'):
		move_delta.y += SQUARE_SIZE
	if Input.is_action_just_pressed('ui_left'):
		move_delta.x -= SQUARE_SIZE
	if Input.is_action_just_pressed('ui_right'):
		move_delta.x += SQUARE_SIZE
	$Player.position += move_delta
