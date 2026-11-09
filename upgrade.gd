extends Control
@onready var upgrade_name_label = $upgrade_name
@onready var price_label = $price
@onready var amount_label = $amount
@onready var score_label =$"../money"
@onready var upgrade_desc_label = $upgrade_desc
# Called when the node enters the scne tree for the first time.
func set_upgrade_data(upgr_name, price, desc):
	upgrade_name_label.text = upgr_name
	price_label.text = "price: " + str(price)
	upgrade_desc_label.text = desc
func canBuy(upgrade_price):
	if GlobalPlayerData.score >= upgrade_price:
		return true
	return false
	
func update_ui(amount,price):
	score_label.text = "BAGUETTES: " + str(GlobalPlayerData.score)
	amount_label.text = "amount: " + str(amount)
	price_label.text = "price: " + str(price)

func calculate_upgrade_price(upgrade, amount):
	var new_price = int(upgrade.starting_price * (1.15**amount))
	upgrade.starting_price = new_price
func buy_upgrade():
	var upgrade_data = self.get_meta("button_info")
	if canBuy(upgrade_data.starting_price):
		GlobalPlayerData.score -= upgrade_data.starting_price
		upgrade_data.amount += 1
		calculate_upgrade_price(upgrade_data, upgrade_data.amount)
		update_ui(upgrade_data.amount,upgrade_data.starting_price)
	else:
		print("i spent all my money on roulette and now im broke as shiii... (ball knowledge)")
func _ready() -> void:
	pass

func _on_pressed() -> void:
	buy_upgrade()
