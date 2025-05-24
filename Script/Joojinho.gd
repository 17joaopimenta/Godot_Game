class_name Game extends Node2D

@export var player: CharacterBody2D

@export var next_level : PackedScene

func _ready() -> void:
	for i in Global.compras:
		print("Ola Mundo")
