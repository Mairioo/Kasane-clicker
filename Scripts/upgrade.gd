extends Control

var Price: int

var Amount: int = 0

var buy = preload("res://audio/buy_1.mp3")
@onready var upgrade_name_label = $upgrade_name
@onready var price_label = $price
@onready var amount_label = $amount
#@onready var score_label =$"../money"
@onready var upgrade_desc_label = $upgrade_desc
@export var Upgrade_Name: String
@export var Starting_Price: int
@export var Description: String
@export_category("Modifiers")
# couldn't think of a better name for "money to be added" lmao, ill have this first upgrade be one that ups ur clicking power
@export var idle_profit:int
#not good at naming stuff, this is how much the click mult increases
@export var click_upgrade_power:int
@export_category("Mathematics...")
@export var Growth_rate: float = 1.15


func _ready() -> void:
	upgrade_name_label.text = Upgrade_Name
	price_label.text = str(Starting_Price)
	upgrade_desc_label.text = Description
	Price = Starting_Price

func _process(_delta: float) -> void:
	
	#change desc in runtime or whatever
	upgrade_name_label.text = Upgrade_Name
	amount_label.text = str(Amount)
	price_label.text = str(Price)
	upgrade_desc_label.text = Description
	
	
	if GlobalPlayerData.score < Price:
		modulate = "ff8688"
	else:
		modulate = "ffffff"

# Called when the node enters the scne tree for the first time.
func set_upgrade_data(upgr_name, price, desc):
	upgrade_name_label.text = upgr_name
	price_label.text = "price: " + str(price)
	upgrade_desc_label.text = desc
func canBuy(upgrade_price):
	if GlobalPlayerData.score >= upgrade_price:
		return true
	return false

func add_idle():
	if idle_profit >= 1:
		var timer = Timer.new()
		timer.one_shot = false
		add_child(timer)
		timer.timeout.connect(func(): GlobalPlayerData.score += idle_profit)
		timer.start()
		
func update_ui(amount,price):
	#score_label.text = "BAGUETTES: " + str(GlobalPlayerData.score)
	amount_label.text = "amount: " + str(amount)
	price_label.text = "price: " + str(price)

func calculate_upgrade_price(upgrade, amount):
	var new_price = int(upgrade.starting_price * (Growth_rate**amount))
	upgrade.price = new_price
	
	
func buy_upgrade():
	# lowk i don't think we have to use metadata for this - octo
	# yeah ur right lmao that was some leftover jank from last night, sorry! - tams
	#var upgrade_data = self.get_meta("button_info")
	if canBuy(Price):
		GlobalPlayerData.score -= Price
		var buy_audio = AudioStreamPlayer.new()
		add_child(buy_audio)
		buy_audio.stream = buy
		buy_audio.play()
		if idle_profit >= 1:
			add_idle()
		GlobalPlayerData.click_mult += click_upgrade_power
		Amount += 1
		Price *= Growth_rate
		#calculate_upgrade_price(upgrade_data, Amount)
		
		
		# i put the update ui in process so you dont have to call a function every time
		#update_ui(upgrade_data.amount,upgrade_data.starting_price)
	else:
		print("i spent all my money on roulette and now im broke as shiii... (ball knowledge)")

func _on_pressed() -> void:
	print("click")
	buy_upgrade()
