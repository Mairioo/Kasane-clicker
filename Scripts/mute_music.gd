extends TextureButton
var is_muted = false
@onready var muted_icon = preload("res://Sprites/muted.svg")
@onready var unmuted_icon = preload("res://Sprites/unmuted.svg")

func _on_pressed() -> void:
	var master_bus_index = AudioServer.get_bus_index("Master")
	if is_muted == false:
		self.texture_normal = muted_icon
		AudioServer.set_bus_mute(master_bus_index, true)
		is_muted = true	
	else:
		self.texture_normal = unmuted_icon
		AudioServer.set_bus_mute(master_bus_index, false)
		is_muted = false
