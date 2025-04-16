class_name SnakeHead extends SnakePart

signal food_eaten
signal collided_with_body

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("food"):
		food_eaten.emit()
		area.call_deferred("queue_free")
	else:
		collided_with_body.emit()
