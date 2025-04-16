class_name Bounds extends Node2D

@onready var upper_left: Marker2D = %UpperLeft
@onready var lower_right: Marker2D = %LowerRight

var x_max: float
var x_min: float
var y_max: float
var y_min: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	x_max = lower_right.position.x - Global.GRID_SIZE
	x_min = upper_left.position.x
	y_max = lower_right.position.y
	y_min = upper_left.position.y + Global.GRID_SIZE


func check_collision(v:Vector2) -> bool:
	if v.x > x_max or v.x < x_min or v.y > y_max or v.y < y_min:
		return true
	return false
