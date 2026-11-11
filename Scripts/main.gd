extends Node2D
#var upgrades_scene = preload("res://Scenes/upgrades.tscn")
@onready var upgrade_container = $CanvasLayer/UI/ScrollContainer/Upgrades
@onready var score_label = $CanvasLayer/UI/money
@onready var upgrade_template = $CanvasLayer/UI/ScrollContainer/Upgrades/upgrade_template
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
