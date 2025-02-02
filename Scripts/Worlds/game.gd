extends Node2D

@export var shop: Control


func _ready() -> void:
	RenderingServer.set_default_clear_color(
		Color(0.379, 0.579, 0.94)
	)


func _process(_delta: float) -> void:
	pass


func on_shop_pressed() -> void:
	if shop == null: return
	shop.visible = true
