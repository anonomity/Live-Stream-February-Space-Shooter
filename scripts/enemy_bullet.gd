extends Area2D

var speed = 150
var damage = 10
func _physics_process(delta):
	global_position = global_position + Vector2.DOWN * delta * speed


func _on_timer_timeout():
	queue_free()


func _on_area_entered(area):
	if area.is_in_group("spaceship"):
		var spaceship = area.get_parent()
		spaceship.take_damage(damage)
