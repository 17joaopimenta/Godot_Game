extends Control

var dinheiro := 100

#Conteudo
var descricao_item := ""
var preco_item := 0.0

#Controle
var index := 0

#Visuais
@onready var saldo: Label = $MarginContainer/Saldo
@onready var nome_do_item: Label = $"MarginContainer/Panel/Nome do Item"
@onready var imagem_do_item: TextureRect = $MarginContainer/Panel/Fundo/ImagemDoItem
@onready var descricao: Label = $MarginContainer/Panel/Fundo/Descricao
@onready var preco: Label = $MarginContainer/Panel/Fundo/Preco

@export var item : PackedScene

#Compras
var item_selecionado

func _ready() -> void:
	for i in Global.compras:
		var item_r = item.instantiate()
		item_r.nameItem.text = i.nome
		item_r.photo.texture = i.portrait
		item_r.description = i.descricao
		item_r.price = i.preco
		item_r.item = i
		$MarginContainer/GridContainer.add_child(item_r)
		item_r.button_down.connect(click_action.bind(item_r))
		print("Nome do individuo : "+i.nome)
		

func _process(delta: float) -> void:
	escrever_na_tela()
	
func escrever_na_tela() -> void:
	saldo.text = "Dinheiros : " + str(dinheiro)
	descricao.text = descricao_item
	preco.text = "Preco : "+str(preco_item)

func _on_compra_button_down() -> void:
	logica_compra()

func logica_compra() -> void:
	if dinheiro >= preco_item:
		dinheiro -= preco_item
		print("Voce comprou > "+nome_do_item.text)
		Global.comprados.append(item_selecionado)
		print(Global.comprados)
		index += 1

func click_action(item_usado) -> void:
	nome_do_item.text = item_usado.nameItem.text
	imagem_do_item.texture = item_usado.photo.texture
	descricao_item = item_usado.description
	preco_item = item_usado.price
	item_selecionado = item_usado.item
	#tipoArma = item

func _on_sair_button_down() -> void:
	get_tree().change_scene_to_file("res://Cenas/Level"+str(Global.numero_level)+".tscn")
