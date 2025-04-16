class_name PauseMenu extends CanvasLayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		queue_free()


func _on_resume_button_pressed() -> void:
	print("resume button pressed")
	queue_free()


func _on_end_game_button_pressed() -> void:
	print("end game button pressed")
	SceneManager.goto_scene("res://ui/menus/post_game_menu.tscn")


func _notification(what: int) -> void:
	match what:
		NOTIFICATION_ENTER_TREE:
			get_tree().paused = true
		NOTIFICATION_EXIT_TREE:
			get_tree().paused = false
