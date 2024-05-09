extends CharacterBody2D

@onready var timer : Timer = $Timer
@onready var progress_bar : ProgressBar = $ProgressBar

@export var hp : int = 100

func _ready():
	progress_bar.max_value = hp
	progress_bar.value = hp
	timer.start()

func _on_timer_timeout():
	var coin = preload("res://scenes/coin.tscn")
	var new_coin = coin.instantiate()
	add_child(new_coin)


func _on_hitbox_body_entered(body):
	take_damage(body.damage)
	body.queue_free()
	die()

func take_damage(damage : int):
	progress_bar.value -= damage
	hp -= damage

func die():
	if hp <= 0:
		queue_free()
