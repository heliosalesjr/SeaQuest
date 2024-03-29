extends Area2D

var velocity = Vector2(1,0)

const SPEED = 25

func _physics_process(delta):
	global_position += velocity * SPEED * delta

func _on_area_entered(area):
	if area.is_in_group("Player"):
		queue_free()
