extends Node2D
@onready var upgrade_container = $CanvasLayer/UI/Upgradeplace/Upgrades
@onready var score_label = $CanvasLayer/UI/money
@onready var upgrade_template = $CanvasLayer/UI/Upgradeplace/Upgrades/upgrades_template
@onready var Anims = $Anims

@onready var ShopButton = $CanvasLayer/UI/Shop

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

func load_game_data():
	GlobalPlayerData.score = SaveAndLoad.content_to_save.money 
	GlobalPlayerData.click_mult = SaveAndLoad.content_to_save.click_mult
	GlobalPlayerData.upgrades = SaveAndLoad.content_to_save.upgrades
	GlobalPlayerData.total_profit = SaveAndLoad.content_to_save.total_profit
	if GlobalPlayerData.total_profit > 0:
		upgrade_template.add_idle()

func save_game_data():
	SaveAndLoad.content_to_save.money = GlobalPlayerData.score
	SaveAndLoad.content_to_save.click_mult = GlobalPlayerData.click_mult
	SaveAndLoad.content_to_save.upgrades = GlobalPlayerData.upgrades
	SaveAndLoad.content_to_save.total_profit = GlobalPlayerData.total_profit
	await SaveAndLoad.save()
	
func _ready() -> void:
	get_tree().set_auto_accept_quit(false)
	load_game_data()
	await make_upgrades()
	
func _process(_delta: float) -> void:
	# removes decimal point if the amount you earn isnt a float
	if GlobalPlayerData.total_profit != floor(GlobalPlayerData.total_profit):
		score_label.text = "BAGUETTES: " + str(GlobalPlayerData.score)
	else:
		score_label.text = "BAGUETTES: " + str(roundi(GlobalPlayerData.score))
		
	if shop_opened:
		ShopButton.text = "Close Shop"
	else:
		ShopButton.text = "Open Shop"

func _notification(what:int):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save_game_data()
		get_tree().quit()
	
func _on_shop_pressed() -> void:
	if shop_opened:
		Anims.play_backwards("ShopEnter")
	else:
		Anims.play("ShopEnter")
	shop_opened = !shop_opened
