extends TextureButton
var score = 0
var click_mult = 1
var hover_scale = Vector2(0.97,0.97)
var clicked_scale = Vector2(0.96,0.96)
@onready var audio = $"../../../teto_audio"
@onready var score_label = $"../money"

var Teato = preload("res://teto-wav.mp3")

## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(button_enter)
	mouse_exited.connect(button_exit)
	call_deferred("pivot_init")
	
func pivot_init():
	pivot_offset = size/2
	
func update_score():
	score += click_mult
	score_label.text = "BAGUETTES: " + str(score)

func button_enter():
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",hover_scale,0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

func button_exit():
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",Vector2.ONE,0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

func button_press_anim():
	
	# WARNING audio nightmare right here
	#var Tetoaudio = AudioStreamPlayer.new()
	#add_child(Tetoaudio)
	#Tetoaudio.stream = Teato
	#Tetoaudio.play()
	#await get_tree().create_timer(0.85).timeout
	#if Tetoaudio != null: Tetoaudio.queue_free()
	
	audio.play()

	var tween = create_tween()
	tween.tween_property(self,"scale",clicked_scale,0.06).set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "scale", Vector2.ONE, 0.1).set_trans(Tween.TRANS_SINE)
func _on_pressed() -> void:
	button_press_anim()
	update_score()
