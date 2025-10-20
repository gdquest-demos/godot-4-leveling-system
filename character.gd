extends Node

# `growth_data` gets passed to the experience progress bar. The first value of the array
# represents the value we animate the bar to, while the second is the maximum experience
# value that the bar represents.
signal experience_gained(growth_data: Array)

# Character stats
@export var max_hp := 12
@export var strength := 8
@export var magic := 8

# Leveling system
@export var level := 1

var experience := 0
var experience_total := 0
var experience_required := get_required_experience(level + 1)


func get_required_experience(for_level: int) -> int:
	return roundi(pow(for_level, 1.8) + for_level * 4)


func gain_experience(amount: int) -> void:
	experience_total += amount
	experience += amount
	var growth_data := []
	while experience >= experience_required:
		experience -= experience_required
		# In case that the amount of experience gained so far is greater than the required
		# experience to level up, we need to fill the experience bar to the max. We repeat
		# this process as long as `experience` is greater or equal with `epxerience_required`.
		growth_data.append([experience_required, experience_required])
		level_up()
	growth_data.append([experience, experience_required])
	experience_gained.emit(growth_data)


func level_up() -> void:
	level += 1
	experience_required = get_required_experience(level + 1)

	var stats: Array[String] = ["max_hp", "strength", "magic"]
	var random_stat := stats[randi() % stats.size()]
	set(random_stat, get(random_stat) + randi() % 4)
