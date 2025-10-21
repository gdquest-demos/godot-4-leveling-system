extends Label

func update_text(character: Character) -> void:
	text = "\n".join(
		[
			"Character",
			"	Max HP: %d",
			"	Strength: %d",
			"	Magic: %d",
			"",
			"	Level: %d",
			"		Experience: %d",
			"		Next level: %d",
		],
	) % [
		character.max_hp,
		character.strength,
		character.magic,
		character.level,
		character.experience,
		character.experience_required,
	]
