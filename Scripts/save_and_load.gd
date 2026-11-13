extends Node
const save_location = "user://SaveFile.json"
var content_to_save: Dictionary = {
	"money": GlobalPlayerData.score,
	"click_mult":GlobalPlayerData.click_mult,
	"upgrades":GlobalPlayerData.upgrades,
	"total_profit":GlobalPlayerData.total_profit
}
func _ready() -> void:
	await _load_save()
	
func save():
	print("saving....")
	var file = FileAccess.open(save_location, FileAccess.WRITE)
	file.store_var(content_to_save.duplicate())
	file.close()
	
func _load_save():
	print("loading...")
	if FileAccess.file_exists(save_location):
		var file = FileAccess.open(save_location, FileAccess.READ)
		var data = file.get_var()
		file.close()
		var save_data = data.duplicate()
		content_to_save.money = save_data.money
		content_to_save.click_mult = save_data.click_mult
		content_to_save.upgrades = save_data.upgrades
		content_to_save.total_profit = save_data.total_profit
		print("TOTAL PROFIT: ",save_data.total_profit)
