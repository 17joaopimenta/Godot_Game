extends Area2D
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D


func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "Destroy":
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.pMoedas += 1
		anim.play("Destroy")
		$CollisionShape2D.queue_free()
