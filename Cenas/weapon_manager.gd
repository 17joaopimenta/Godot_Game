extends Node

var weaponType : Array[Weapon] = [load("res://Resource/bala_normal.tres")]
@onready var player = get_parent()

var index : int
var order_index : int
var rodaRoda
var event
var num_key 

@export var debug_mode : bool
@export var image_w : TextureRect
@onready var timer: Timer = $Timer

var test_index : Array[int] = [49,50,51,52,53,54,55,56,57]

func _ready() -> void:
	image_w.visible = false
	for i in Global.comprados:
		weaponType.append(i)
	player.bala_r = weaponType

func _process(delta: float) -> void:
	player.anim.modulate = Color(weaponType[index].color[0],weaponType[index].color[1],weaponType[index].color[2])
	image_w.texture = weaponType[index].portrait
	player.tipo_bala = weaponType[index].tipo
	player.sprite = weaponType[index].sprite
	player.dano = weaponType[index].dano if !debug_mode else 7

func _change_weapon(event):
	if event == -1 or event > weaponType.size() - 1: return
	index = event

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		_change_weapon(test_index.find(event.keycode))	
		if order_index != index:
			image_w.visible = true
			timer.start()
			print("Diferente")
			order_index = index

func _on_timer_timeout() -> void:
	image_w.visible = false
