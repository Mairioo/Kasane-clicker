extends Node2D
@onready var upgrade_container = $CanvasLayer/UI/Upgradeplace/Upgrades
@onready var score_label = $CanvasLayer/UI/money
@onready var upgrade_template = $CanvasLayer/UI/Upgradeplace/Upgrades/upgrade_template
@onready var Anims = $Anims
var upgrade_instance:Button
var button_height = 65
var upgrade_clicked

var shop_opened: bool = false
func make_upgrades():
	for key in GlobalPlayerData.upgrades:
		var current_upgrade = upgrade_template.duplicate()
		current_upgrade.visible = true
		upgrade_container.add_child(current_upgrade)
		current_upgrade.set_upgrade_data(key)
func _ready() -> void:
	make_upgrades()
	pass
	
func _process(_delta: float) -> void:
	score_label.text = "BAGUETTES: " + str(GlobalPlayerData.score)
	
func _on_shop_pressed() -> void:
	if shop_opened:
		Anims.play_backwards("ShopEnter")
	else:
		Anims.play("ShopEnter")
	shop_opened = !shop_opened
