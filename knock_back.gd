extends Node
var bod = true
var kb_rb = false

func _ready() -> void:
	bod = get_parent() is CharacterBody2D

func knock_back() -> void:
	if bod:
		get_parent().apply_knockback = true
		print("Enemigo")
	else:
		get_parent().apply_impulse(Vector2(100,-100),Vector2(0,0))
