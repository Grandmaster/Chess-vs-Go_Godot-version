extends Area2D

var board_position = Vector3.ZERO
onready var squareSprite = $Sprite
onready var highlightTexture = load("res://images/Highlighted Square.png")
onready var normalTexture = squareSprite.texture
signal chosen_piece

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		click()

func click():
	squareSprite.texture = highlightTexture
	if get_child_count() > 2:
		emit_signal("chosen_piece", self, get_child(2))


func reset():
	squareSprite.texture = normalTexture
