extends Marker2D

@onready var timer : Timer = $Timer
@export var spawn_interval_min : float = 1
@export var spawn_interval_max : float = 2
@export var itens : Array[PackedScene] = []

func _ready():
	timer.start(randf_range(spawn_interval_min, spawn_interval_max))
	
func spawn_something():
	var slime = itens.pick_random()
	var new_slime = slime.instantiate()
	add_child(new_slime)
	timer.start(randf_range(spawn_interval_min, spawn_interval_max))

func _on_timer_timeout():
	spawn_something()
