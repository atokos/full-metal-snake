extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_new_game_button_pressed() -> void:
	print("new game button pressed")
	SceneManager.goto_scene("res://stages/game/game.tscn")


func _on_quit_button_pressed() -> void:
	print("quit button pressed")
	SceneManager.goto_scene("res://ui/menus/start_menu.tscn")
