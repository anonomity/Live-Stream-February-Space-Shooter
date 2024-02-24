extends Sprite2D

const BULLET = preload("res://scenes/bullet.tscn")
@onready var marker_2d = $Marker2D

@export var bullets_node : Node2D

var health : int = 100
@onready var lose_control = $CanvasLayer/lose_control
@onready var label = $CanvasLayer/lose_control/Label

@onready var health_bar = $CanvasLayer/Control/health_bar

var freeze_game = false

func _ready():
	lose_control.hide()
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _physics_process(delta):
	if !freeze_game:
		global_position = get_global_mouse_position()
		if Input.is_action_just_pressed("shoot"):
			shoot()

func take_damage(amount):
	health -= amount
	health_bar.value = health
	if health <= 0:
		lose_game()

func win_game():
	label.text = "You Win like Lupito and Frumi"
	end_game_controls()

func end_game_controls():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	freeze_game = true
	lose_control.show()

func lose_game():
	label.text = "You Lose Like Tom Milman"
	end_game_controls()

func shoot():
	var bullet = BULLET.instantiate()	
	bullets_node.add_child(bullet)
	bullet.global_position = marker_2d.global_position


func _on_play_again_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
