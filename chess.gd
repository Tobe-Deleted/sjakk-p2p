extends Sprite2D

const BOARD_SIZE = 8
const CELL_WIDTH = 18

const TEXTURE_HOLDER = preload("res://Scenes/texture_holder.tscn")

const WHITE_KING = preload("res://Assets/king-white-outlined.png") #1
const WHITE_ROOK = preload("res://Assets/rook-white-outlined.png") #2
const WHITE_KNIGHT = preload("res://Assets/knight-white-outlined.png") #3
const WHITE_PAWN = preload("res://Assets/pawn-white-outlined.png") #4
const WHITE_QUEEN = preload("res://Assets/queen-white-outlined.png") #5
const WHITE_BISHOP = preload("res://Assets/bishop-white-outlined.png") #6

const BLACK_KING = preload("res://Assets/king-black-outlined.png") #7
const BLACK_ROOK = preload("res://Assets/rook-black-outlined.png") #8
const BLACK_KNIGHT = preload("res://Assets/knight-black-outlined.png") #9
const BLACK_PAWN = preload("res://Assets/pawn-black-outlined.png") #10
const BLACK_QUEEN = preload("res://Assets/queen-black-outlined.png") #11
const BLACK_BISHOP = preload("res://Assets/bishop-black-outlined.png") #12

@onready var pieces = $Pieces
@onready var available_moves = $Available_Moves
@onready var white_perspective: Sprite2D = $white_perspective
@onready var black_perspective: Sprite2D = $black_perspective

var board: Array
var white: bool
var state: bool
var moves: = []
var seleceted_piece: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	board.append([2,3,6,5,1,6,3,2]) #row 1
	board.append([4,4,4,4,4,4,4,4]) #row 2
	board.append([0,0,0,0,0,0,0,0]) #row 3
	board.append([0,0,0,0,0,0,0,0]) #row 4
	board.append([0,0,0,0,0,0,0,0]) #row 5
	board.append([0,0,0,0,0,0,0,0]) #row 6
	board.append([10,10,10,10,10,10,10,10]) #row 7
	board.append([8,9,12,11,7,12,9,8]) #row 8
	
	display_board()

func display_board():
	for i in BOARD_SIZE:
		for j in BOARD_SIZE:
			var holder = TEXTURE_HOLDER.instantiate()
			pieces.add_child(holder)
			holder.global_position = Vector2(j * CELL_WIDTH + (CELL_WIDTH/2), -i * CELL_WIDTH - (CELL_WIDTH/2))
			
			match board[i][j]:
				0: holder.texture = null
				
				1: holder.texture = WHITE_KING
				2: holder.texture = WHITE_ROOK
				3: holder.texture = WHITE_KNIGHT
				4: holder.texture = WHITE_PAWN
				5: holder.texture = WHITE_QUEEN
				6: holder.texture = WHITE_BISHOP
				
				7: holder.texture = BLACK_KING
				8: holder.texture = BLACK_ROOK
				9: holder.texture = BLACK_KNIGHT
				10: holder.texture = BLACK_PAWN
				11: holder.texture = BLACK_QUEEN
				12: holder.texture = BLACK_BISHOP
