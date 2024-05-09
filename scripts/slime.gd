extends CharacterBody2D

@export var speed : float = 5000
@export var hp : float = 50
@onready var progress_bar : ProgressBar = $ProgressBar
@onready var hitbox = $Hitbox
@export var damage : int = 20

func _ready():
	progress_bar.max_value = hp
	progress_bar.value = hp

func _physics_process(delta):
	velocity = Vector2(-speed * delta, 0)
	move_and_slide()
	die()

func take_damage(damage : float):
	progress_bar.value -= damage
	hp -= damage

func die():
	if hp <= 0:
		queue_free()
