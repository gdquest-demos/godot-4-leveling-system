extends TextureProgressBar

func initialize(current: int, maximum: int) -> void:
	max_value = maximum
	value = current


func _on_character_experience_gained(growth_data: Array) -> void:
	for line in growth_data:
		var target_exp: int = line[0]
		var max_exp: int = line[1]
		max_value = max_exp
		await _animate_value(target_exp)

		# We make sure to reset the progress bar back to `0.0` when the current experience
		# value fills up to `max_value`.
		if abs(max_value - value) < 0.01:
			value = 0.0


func _animate_value(target: int, tween_duration := 1.0) -> void:
	var tween := create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "value", target, tween_duration)
	await tween.finished
