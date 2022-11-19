# Class that takes a number and builds a corneredsquareboard data strucuture
# out of it; the number represents the number of squares on the board

class_name CorneredSquareBoard
var data = []
var piece_board = []
var stone_board = []

func _init(m):
	var board1 = Board.new(m, 0) # squares
	var board2 = Board.new(m + 1, 1) # corners
	var data1 = []
	var data2 = []
	data1 = board1.data
	data2 = board2.data
	piece_board = board1.data.duplicate(true)
	stone_board = board2.data.duplicate(true)
	# Constructing the intertwined board
	var i = 0;
	var s = data1.size()
	while i < s:
		null_insert(data1[i], 0)
		null_insert(data2[i], 1)
		data.append(data2[i])
		data.append(data1[i])
		i = i + 1
	null_insert(data2[i], 1)
	data.append(data2[i])

func null_insert(arr, type):
	# function to insert "null" between each item in an array,
	# with type determining whether the null insert begins at the beginning of the 
	# array or after the first item
	if type == 0: # squares
		for i in range(0, 2 * arr.size() + 2, 2):
			arr.insert(i, null)
	elif type == 1: # corners
		for i in range(1, 2 * arr.size() - 1, 2):
			arr.insert(i, null)
	
