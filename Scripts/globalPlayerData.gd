extends Node
var click_mult = 1
var score = 0
var total_profit = 0
var upgrades = [
	{
		"name":"More Baguettes",
		"starting_price":20,
		"amount":0,
		"idle_profit": 0.2,
		"upgrade_description":"+0.2 baguettes per second"
	},
	{
		"name":"Local Bakery",
		"starting_price":115,
		"amount":0,
		"idle_profit":2,
		"upgrade_description":"+2 baguettes per second"
	},
	{
		"name":"Wheat farm",
		"starting_price":8000,
		"amount":0,
		"idle_profit": 5,
		"upgrade_description":"+5 baguettes per second"
	},
	{
		"name":"Baguette Factory",
		"starting_price": 100000,
		"amount":0,
		"idle_profit":10,
		"upgrade_description":"+10 baguettes per second"
	},
	{
		"name":"Baguette Bank",
		"starting_price":1000000,
		"amount":0,
		"idle_profit":20,
		"upgrade_description":"+20 baguettes per second"
	},
	{
	"name":"Baguette Dimension",
	"starting_price":5000000,
	"amount":0,
	"idle_profit":100,
	"upgrade_description":"+100 baguettes per second"
	},
	{
		"name":"Baguette planet",
		"starting_price":10000000,
		"amount":0,
		"idle_profit":1000,
		"upgrade_description":"+1000 baguettes per second"
	}
]
