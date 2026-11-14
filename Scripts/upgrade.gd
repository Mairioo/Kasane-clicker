extends Control
# this is the best way i could come up with to do stuff modularly, sorry.
var upgrade_data: Dictionary = {}
var buy = preload("res://audio/buy_1.mp3")
@onready var upgrade_name_label = $upgrade_name
@onready var price_label = $price
@onready var amount_label = $amount
@onready var upgrade_desc_label = $upgrade_desc
@export_category("Mathematics...")
@export var Growth_rate: float = 1.1

func _ready() -> void:
	pass
func _process(_delta: float) -> void:
	if upgrade_data.is_empty():
		return
	amount_label.text = str(upgrade_data.amount)
	price_label.text = str(upgrade_data.starting_price)
	if GlobalPlayerData.score < upgrade_data.starting_price:
		modulate = "ff8688"
	else:
		modulate = "ffffff"
		
func set_upgrade_data(data):
	# this is the upgrade buttons data. 
	upgrade_data = data
	upgrade_name_label.text = upgrade_data.name
	price_label.text = "price: " + str(upgrade_data.starting_price)
	upgrade_desc_label.text = upgrade_data.upgrade_description
	
func canBuy(upgrade_price):
	if GlobalPlayerData.score >= upgrade_price:
		return true
	return false

func add_idle():
	var timer = Timer.new()
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(func(): GlobalPlayerData.score += GlobalPlayerData.total_profit)
	timer.start()
func play_buy_audio():
	var buy_audio = AudioStreamPlayer.new()
	add_child(buy_audio)
	buy_audio.stream = buy
	buy_audio.play()
	
func buy_upgrade():
	if canBuy(upgrade_data.starting_price):
		GlobalPlayerData.score -= upgrade_data.starting_price
		GlobalPlayerData.total_profit += upgrade_data.idle_profit
		add_idle()
		play_buy_audio()
		upgrade_data.amount += 1
		var new_price = upgrade_data.starting_price * (Growth_rate**upgrade_data.amount)
		upgrade_data.starting_price = int(new_price)

func _on_pressed() -> void:
	buy_upgrade()
