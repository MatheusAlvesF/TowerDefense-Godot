extends AnimatedSprite2D

@export var speed : float = 100
@export var damage : float = 25

func _physics_process(delta):
	global_position += Vector2(speed * delta, 0)

func _on_area_2d_body_entered(body):
	print("colidiu")
	if body.has_method("take_damage"):
		body.take_damage(damage)
		queue_free()
