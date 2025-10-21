extends Node

@onready var _character: Character = %Character
@onready var _label: Label = %Label
@onready var _experience_bar: TextureProgressBar = %ExperienceBar


func _ready() -> void:
	randomize()
	_label.update_text(_character)
	_experience_bar.initialize(_character.experience, _character.experience_required)


func _unhandled_input(event: InputEvent) -> void:
	if not event.is_action_pressed("ui_accept"):
		return

	# We just picked a random value to increase the experience by. At higher levels you
	# need to gain this experience multiple times before leveling up.
	_character.gain_experience(34)
	_label.update_text(_character)
