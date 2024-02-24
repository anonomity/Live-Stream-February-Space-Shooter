extends Area2D

@export var speed : int

func _physics_process(delta):
	global_position = global_position + Vector2.UP * delta * speed

func _on_timer_timeout():
	queue_free()



func _on_area_entered(area):
	if area.is_in_group("enemy"):
		var enemy = area
		enemy.get_parent().queue_free()
		queue_free()

