extends AnimatedSprite2D

var velocity = Vector2(0,0)
var can_shoot = true

const SPEED = Vector2(125, 90)
const Bullet = preload("res://scenes/player_bullet.tscn")

@onready var reload_timer = $ReloadTimer

func _process(delta):
	velocity.x = Input.get_axis("move_left", "move_right")
	velocity.y = Input.get_axis("move_up", "move_down")
	
	velocity = velocity.normalized()
	
	if velocity.x > 0:
		flip_h = false
	elif velocity.x < 0:
		flip_h = true
	else:
		pass
	
	if Input.is_action_pressed("shoot") and can_shoot:
		var bullet_instance = Bullet.instantiate()
		bullet_instance.global_position = global_position
		get_tree().current_scene.add_child(bullet_instance)
		
		if flip_h:
			bullet_instance.velocity.x = -1
			bullet_instance.flip_h = true
			
		reload_timer.start()
		can_shoot = false

func _physics_process(delta):
	global_position += velocity * SPEED  * delta

func _on_reload_timer_timeout():
	can_shoot = true
