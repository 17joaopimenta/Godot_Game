extends VBoxContainer

@onready var photo := get_child(0) # foto do item
@onready var nameItem := get_child(1) # nome do item
@onready var control: Control = $"../../../.."

@export var description : String
@export var price : float

#func _process(delta: float) -> void:
	#print("Saldo do Praiyer : "+str(control.dinheiro))

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		get_content()
		control.isClicked = true
	#elif event is InputEventMouseMotion:
		#print("Em cima do item : "+nameItem.text)

func get_content():
	control.nome_do_item.text = nameItem.text
	control.imagem_do_item.texture = photo.texture
	control.descricao_item = description
	control.preco_item = price
