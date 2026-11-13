extends TextureButton
var hover_scale = Vector2(0.97,0.97)
var clicked_scale = Vector2(0.96,0.96)
var click = preload("res://audio/click sound.mp3")
func _ready() -> void:
	mouse_entered.connect(button_enter)
	mouse_exited.connect(button_exit)
	call_deferred("pivot_init")
	
func pivot_init():
	pivot_offset = size/2
	
func update_score():
	GlobalPlayerData.score += GlobalPlayerData.click_mult
func play_click_audio():
	var click_audio = AudioStreamPlayer.new()
	add_child(click_audio)
	click_audio.stream = click
	click_audio.volume_db = -12
	click_audio.play()
	
func button_enter():
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",hover_scale,0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

func button_exit():
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",Vector2.ONE,0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

func button_press_anim():
	var tween = create_tween()
	tween.tween_property(self,"scale",clicked_scale,0.06).set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "scale", Vector2.ONE, 0.1).set_trans(Tween.TRANS_SINE)
func _on_pressed() -> void:
	button_press_anim()
	play_click_audio()
	update_score()
