extends Area2D

const ENEMY_BULLET = preload("res://scenes/enemy_bullet.tscn")
@onready var marker_2d = $Marker2D

func _on_shoot_timer_timeout():
	shoot()


func shoot():
	var enemy_bullet = ENEMY_BULLET.instantiate()
	var bullets_node = get_parent().get_parent().bullets_node
	bullets_node.add_child(enemy_bullet)
	enemy_bullet.global_position = marker_2d.global_position
