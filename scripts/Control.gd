extends Control

signal dadosVida
signal dadosTempoTiro

@export var vida : int = 5
@export var tempo_tiro : float = 0.1


#func _physics_process(_delta):
	#emit_signal("dadosVida", vida)
	#emit_signal("dadosTempoTiro", tempo_tiro)

func _on_curar_vida_pressed():
	emit_signal("dadosVida", vida)

func _on_aumentar_velocidade_pressed():
	emit_signal("dadosTempoTiro", tempo_tiro)

func _on_aumentar_dano_pressed():
	pass # Replace with function body.
