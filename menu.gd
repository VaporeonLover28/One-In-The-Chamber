extends Node2D

func _ready() -> void:
	await get_tree().create_timer(1.5).timeout
	$anim.play("menu")

func _on_plei_button_up() -> void:
	$black.z_index = 10
	$anim.play("change")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://instructions.tscn")

func _on_opissoes_button_up() -> void:
	pass # Replace with function body.

func _on_cuite_button_up() -> void:
	$black.z_index = 10
	$anim.play("change")
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
