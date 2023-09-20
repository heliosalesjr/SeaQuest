extends Area2D

const SPEED = 100
const MOVEMENT_FREQUENCY = 0.1
const MOVEMENT_AMPLITUDE = 0.3

var velocity = Vector2(1,0)


func _physics_process(_delta):
	velocity.y = sin(global_position.x * MOVEMENT_FREQUENCY) * MOVEMENT_AMPLITUDE
	global_position += velocity * SPEED * _delta



func _on_area_entered(area):
	if area.is_in_group("PlayerBullet"):
		area.queue_free()
		queue_free()
