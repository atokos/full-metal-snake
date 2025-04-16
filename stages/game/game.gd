extends Node2D

@onready var head: SnakeHead = %SnakeHead as SnakeHead
@onready var bounds: Bounds = %Bounds as Bounds

const pausemenu_scene: PackedScene = preload("res://ui/menus/pause_menu.tscn")
var pause_menu: PauseMenu

var time_between_moves: float = 1000.0
var time_since_last_move: float = 0
var speed: float = 5000.0
var move_dir: Vector2 = Vector2.RIGHT

var snake_parts: Array[SnakePart] = []
var score: int = 0

func _ready() -> void:
	print("Im in the main game, yay!")
	snake_parts.push_back(head)


func _process(delta: float) -> void:
	handle_input()


func _physics_process(delta: float) -> void:
	time_since_last_move += delta * speed
	if time_since_last_move >= time_between_moves:
		update_snake()
		time_since_last_move = 0


func handle_input() -> void:
	if Input.is_action_pressed("ui_up"):
		move_dir = Vector2.UP
	if Input.is_action_pressed("ui_right"):
		move_dir = Vector2.RIGHT
	if Input.is_action_pressed("ui_down"):
		move_dir = Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		move_dir = Vector2.LEFT
	if Input.is_action_just_pressed("ui_cancel"):
		pause_game()


func update_snake() -> void:
	var new_position: Vector2 = head.position + move_dir * Global.GRID_SIZE
	if bounds.check_collision(new_position): 
		print("game over")
	else: 
		head.move_to(new_position)
	
	for i in range(1, snake_parts.size(), 1):
		snake_parts[i].move_to(snake_parts[i-1].last_position)


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_WINDOW_FOCUS_OUT:
		pause_game()


func pause_game() -> void:
	if not pause_menu:
		pause_menu = pausemenu_scene.instantiate() as PauseMenu
		add_child(pause_menu)
