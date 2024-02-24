extends Node2D

const ENEMY_1_FOLLOW = preload("res://scenes/enemy_1_follow.tscn")
var enemy_amount = 5
@onready var path_2d = $Path2D
@onready var check_if_wave_done_timer = $check_if_wave_done_timer
@onready var spaceship = $spaceship


func _ready():
	populate_path()
	check_if_wave_done_timer.start()
	
func populate_path():
	for i in range(enemy_amount):
		var enemy : PathFollow2D = ENEMY_1_FOLLOW.instantiate()
		await get_tree().create_timer(1.0).timeout
		path_2d.add_child(enemy)
		
func _on_check_if_wave_done_timer_timeout():
	if path_2d.get_child_count() == 0:
		spaceship.win_game()
		check_if_wave_done_timer.stop()
