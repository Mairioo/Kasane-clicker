extends Node
var click_mult = 1
var score = 0
var upgrades = [
	{
		"name":"More Baguettes",
		"starting_price":20,
		"amount":0,
		"idle_profit": 1,
		"upgrade_description":"+1 baguettes per second"
	},
	{
		"name":"Local Bakery",
		"starting_price":115,
		"amount":0,
		"idle_profit":5,
		"upgrade_description":"+5 baguettes per second"
	},
	{
		"name":"Wheat farm",
		"starting_price":1000,
		"amount":0,
		"idle_profit": 10,
		"upgrade_description":"upgrade description? i hardly know her!"
	},
	{
		"name":"Baguette Factory",
		"starting_price": 5000,
		"amount":0,
		"idle_profit":20,
		"upgrade_description":"+15 baguettes per second"
	}
]
