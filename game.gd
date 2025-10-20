extends Node

@onready var _character := %Character
@onready var _label: Label = %Label
@onready var _experience_bar: TextureProgressBar = %ExperienceBar


func _ready() -> void:
	_label.update_text(_character.level, _character.experience, _character.experience_required)
	_experience_bar.initialize(_character.experience, _character.experience_required)


func _unhandled_input(event: InputEvent) -> void:
	if not event.is_action_pressed("ui_accept"):
		return

	# We just picked a random value to increase the experience by. Notice how the higher level
	# need you to run this function multiple times before leveling up.
	_character.gain_experience(34)
	_label.update_text(_character.level, _character.experience, _character.experience_required)
