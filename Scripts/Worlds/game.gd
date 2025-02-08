extends Node2D

@export var shop: Control
@export var inventory: Control

@export var coin: Label


func _ready() -> void:
	RenderingServer.set_default_clear_color(
		Color(0.379, 0.579, 0.94)
	)
	
	coin.text = str(Global.coins) + "g"


func _process(_delta: float) -> void:
	pass


func on_shop_pressed() -> void:
	if inventory.visible:
		inventory.visible = false

	shop.visible = true


func on_inventory_pressed() -> void:
	inventory.visible = !inventory.visible
