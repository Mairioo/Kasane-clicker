extends Node2D
#var upgrades_scene = preload("res://Scenes/upgrades.tscn")
@onready var upgrade_container = $CanvasLayer/UI/Upgradeplace/Upgrades
@onready var score_label = $CanvasLayer/UI/money
@onready var upgrade_template = $CanvasLayer/UI/Upgradeplace/Upgrades/upgrade_template
@onready var Anims = $Anims
#@onready var button = $CanvasLayer/UI/Button
var upgrade_instance:Button
var button_area = Vector2(884, 208)
var button_height = 65
var upgrade_clicked

var shop_opened: bool = false

func position_upgrades(dict_key,item):
	var i = GlobalPlayerData.upgrades.find(dict_key) 
	var offset_y = i * button_height
	item.global_position = button_area + Vector2(0, offset_y)
	
	
# buttons are a scene you you can add them manually now :>
# buttons being added manually is getting kinda annoying, though, i wont delete anything quite yet but imma make the modular
func make_upgrades():
	for key in GlobalPlayerData.upgrades:
		var current_upgrade = upgrade_template.duplicate()
		current_upgrade.visible = true
		#upgrade_instance.set_meta("button_info",key)
		upgrade_container.add_child(current_upgrade)
		current_upgrade.set_upgrade_data(key)
func _ready() -> void:
	make_upgrades()
	pass
	#make_upgrades()


func _on_shop_pressed() -> void:
	if shop_opened:
		Anims.play_backwards("ShopEnter")
	else:
		Anims.play("ShopEnter")
	shop_opened = !shop_opened
