# A custom class that defines the data structure that an nxn square
# board will use for this game.

class_name Board
var data = []

func _init(n, z):
	# Builds a 2D array of size n; z determines corners or square
	var i = 0;
	var j = 0;
	while i < n:
		data.append([])
		while j < n:
			data[i].append(Vector3(i + 1,j + 1,z))
			j = j + 1
		i = i + 1
		j = 0

