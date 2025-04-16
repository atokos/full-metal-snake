extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_new_button_pressed() -> void:
	print("new button pressed")
	SceneManager.goto_scene("res://stages/game/game.tscn")


func _on_load_button_pressed() -> void:
	print("load button pressed")


func _on_quit_button_pressed() -> void:
	print("quit button pressed")
