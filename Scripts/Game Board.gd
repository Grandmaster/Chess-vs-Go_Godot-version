extends Node2D
var dsquare = preload("res://Game/Dark square.tscn")
var lsquare = preload("res://Game/Light square.tscn")
var board_size = 8 # dimensions of the square board
var step = 64 # size of squares in pixels
var topleft = -step * (board_size / 2)
var topleftsquare = Vector2(topleft, topleft) # location of top left square

# Constructing the data structure that represents the board
var board = CorneredSquareBoard.new(board_size) 

func _ready():
	position = get_viewport_rect().size / 2
	build_board()

func build_board():
	for row in board.piece_board:
		for square in row:
			var refx = square.x - 1
			var refy = square.y - 1
			var sum: int = square.y + square.x
			var squareinstance
			if sum % 2 == 0:
				squareinstance = dsquare.instance()
			else : 
				squareinstance = lsquare.instance()
			self.add_child(squareinstance)
			squareinstance.position.x = topleft + (refx * step)
			squareinstance.position.y = topleft + (refy * step)
			squareinstance.board_position = Vector3(square.x, square.y, 0)
			board.piece_board[refx][refy] = squareinstance
