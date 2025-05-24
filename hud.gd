extends Control
@onready var vida_txt: Label = $MarginContainer/VBoxContainer/Vidas/VidaTxt
@onready var baterias := $MarginContainer/VBoxContainer/Moedonas.get_children()
@onready var moeda_txt: Label = $MarginContainer/VBoxContainer/Moedas/MoedaTxt

@export var player : CharacterBody2D

func _process(delta: float) -> void:
	
	if player == null:
		print("Cabo Chefia")
		return
	
	moeda_txt.text = "X " + str(Global.pMoedas)
	vida_txt.text = "X " + str(player.vidas)
	match player.baterias:
		0:
			baterias[0].modulate.a = 0.5
			baterias[1].modulate.a = 0.5
			baterias[2].modulate.a = 0.5
		1:
			baterias[0].modulate.a = 1
			baterias[1].modulate.a = 0.5
			baterias[2].modulate.a = 0.5
		2:
			baterias[0].modulate.a = 1
			baterias[1].modulate.a = 1
			baterias[2].modulate.a = 0.5
		3:
			baterias[0].modulate.a = 1
			baterias[1].modulate.a = 1
			baterias[2].modulate.a = 1
