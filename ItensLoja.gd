extends Button

@export var photo : TextureRect # foto do item
@export var nameItem : Label # nome do item

var description : String
var price : float
@export var item : Weapon
#func _process(delta: float) -> void:
	#print("Saldo do Praiyer : "+str(control.dinheiro))

#func _gui_input(event):
	#if event is InputEventMouseButton and event.pressed:
		#get_content()
		#control.isClicked = true
	#elif event is InputEventMouseMotion:
		#print("Em cima do item : "+nameItem.text)
