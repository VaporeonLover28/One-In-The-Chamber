extends Node2D

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	$anim.play("menu")

func _on_plei_button_up() -> void:
	pass
