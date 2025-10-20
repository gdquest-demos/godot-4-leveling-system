extends Label

func update_text(level: int, experience: int, required_exp: int) -> void:
	text = """Level: %d
			Experience: %d
			Next level: %d
			""" % [level, experience, required_exp]
