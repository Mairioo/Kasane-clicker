extends Node2D
var upgrades_scene = preload("res://Scenes/upgrades.tscn")
@onready var UI = $CanvasLayer/UI
@onready var score_label = $CanvasLayer/UI/money
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
#func make_upgrades():
	#for key in GlobalPlayerData.upgrades:
		#var current_upgrade_name = key['name']
		#var starting_price = key['starting_price']
		#var description = key["upgrade_description"]
		#upgrade_instance = button.duplicate()
		#upgrade_instance.visible = true
		#upgrade_instance.set_meta("button_info",key)
		#position_upgrades(key,upgrade_instance)
		#UI.add_child(upgrade_instance)
		#upgrade_instance.set_upgrade_data(current_upgrade_name, starting_price,description)

#func buy_upgrade():
	#var clicked_upgrade = upgrade_instance.give_upgrade_name()
	#print(clicked_upgrade)
func _ready() -> void:
	pass
	#make_upgrades()


func _on_shop_pressed() -> void:
	if shop_opened:
		Anims.play_backwards("ShopEnter")
	else:
		Anims.play("ShopEnter")
	shop_opened = !shop_opened
