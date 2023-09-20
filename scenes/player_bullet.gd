extends AnimatedSprite2D

var velocity = Vector2(1,0)

const SPEED = 300

func _ready():
	rotation_degrees = randf_range(-7,7)
	velocity = velocity.rotated(rotation)
	
func _physics_process(_delta):
	global_position += velocity * SPEED * _delta
	
func flip_direction():
	velocity = -velocity
	flip_h = !flip_h

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
