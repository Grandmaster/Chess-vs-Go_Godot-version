extends Node2D

var formerChosenSquare = null
var chosenPiece = null

func _ready():
	for square in get_children():
		square.connect("chosen_piece", self, "call_piece")

func call_piece(square, piece):
	if formerChosenSquare != null:
		formerChosenSquare.reset()
	
	formerChosenSquare = square
	chosenPiece = piece
