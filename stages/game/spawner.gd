class_name Spawner extends Node2D

signal body_added(body: SnakeBody)

@export var bounds: Bounds

var food_scene: PackedScene = preload("res://entities/food/food.tscn")
var body_scene: PackedScene = preload("res://entities/snake/snake_body.tscn")

func spawn_food() -> void:
	var spawn_point: Vector2 = Vector2.ZERO
	spawn_point.x = randf_range(bounds.x_min + Global.GRID_SIZE, bounds.x_max - Global.GRID_SIZE)
	spawn_point.y = randf_range(bounds.y_min + Global.GRID_SIZE, bounds.y_max - Global.GRID_SIZE)
	spawn_point.x = floorf(spawn_point.x / Global.GRID_SIZE) * Global.GRID_SIZE
	spawn_point.y = floorf(spawn_point.y / Global.GRID_SIZE) * Global.GRID_SIZE
	
	var food = food_scene.instantiate()
	food.position = spawn_point
	get_parent().add_child(food)


func spawn_body(position: Vector2) -> void:
	var body: SnakeBody = body_scene.instantiate() as SnakeBody
	body.position = position
	get_parent().add_child(body)
	body_added.emit(body)
