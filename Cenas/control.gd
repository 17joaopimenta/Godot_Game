extends Control

var dinheiro := 50

#Conteudo
var descricao_item := ""
var preco_item := 0.0

#Controle
var isClicked := false
var index := 0

#Visuais
@onready var saldo: Label = $MarginContainer/Saldo
@onready var nome_do_item: Label = $"MarginContainer/Panel/Nome do Item"
@onready var imagem_do_item: TextureRect = $MarginContainer/Panel/Fundo/ImagemDoItem
@onready var descricao: Label = $MarginContainer/Panel/Fundo/Descricao
@onready var preco: Label = $MarginContainer/Panel/Fundo/Preco

func _process(delta: float) -> void:
	escrever_na_tela()
	
func escrever_na_tela() -> void:
	saldo.text = "Dinheiros : " + str(dinheiro)
	descricao.text = descricao_item
	preco.text = "Preco : "+str(preco_item)

func _on_compra_button_down() -> void:
	logica_compra()

func logica_compra() -> void:
	if dinheiro >= preco_item and isClicked:
		dinheiro -= preco_item
		print("Voce comprou > "+nome_do_item.text)
		Global.compras.erase("Nothing")
		Global.compras.append(descricao_item)
		print(Global.compras[index])
		index += 1

func _on_sair_button_down() -> void:
	get_tree().change_scene_to_file("res://menu_inicial.tscn")
