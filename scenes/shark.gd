extends Area2D

const SPEED = 50
const MOVEMENT_FREQUENCY = 0.1
const MOVEMENT_AMPLITUDE = 0.3

var velocity = Vector2(1,0)

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(_delta):
	velocity.y = sin(global_position.x * MOVEMENT_FREQUENCY) * MOVEMENT_AMPLITUDE
	global_position += velocity * SPEED * _delta

func flip_direction():
	velocity = -velocity
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h


func _on_area_entered(area):
	if area.is_in_group("PlayerBullet"):
		area.queue_free()
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
