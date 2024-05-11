extends CharacterBody2D

@onready var timer : Timer = $Timer
@onready var progress_bar : ProgressBar = $ProgressBar

@export var tempo_tiro : float = 1
@export var hp : int = 100

func _ready():
	progress_bar.max_value = hp
	progress_bar.value = hp
	timer.start(tempo_tiro)

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


func _on_control_dados_vida(vida : int):
	if hp + vida > progress_bar.max_value:
		hp = progress_bar.max_value
		print("vida maxima: " + str(progress_bar.max_value))
	else: 
		hp += vida
		progress_bar.value += vida
		print("vida maxima: " + str(progress_bar.max_value))


func _on_control_dados_tempo_tiro(cd : float):
	tempo_tiro -= cd
	timer.start(tempo_tiro)
