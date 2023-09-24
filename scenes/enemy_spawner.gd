extends Node2D

const Shark = preload("res://scenes/shark.tscn")

var used_spawn_points = []

@onready var left = $Left
@onready var right = $Right

func _on_spawn_enemy_timer_timeout():
	
	for i in range(4):
		spawn_enemy()
	
	used_spawn_points.clear()
	
func spawn_enemy():
	
	var avaliable_spawn_points = []
	
	for i in range(1,5):
		if !used_spawn_points.has(i):
			avaliable_spawn_points.append(i)
			
	var rand_spawn_point_index = randi_range(0,avaliable_spawn_points.size() - 1)
	var selected_spawn_point_number = avaliable_spawn_points[rand_spawn_point_index]
	used_spawn_points.append(selected_spawn_point_number)
	
	var rand_spawn_point_number = randi_range(1,4)
	
	var selected_side_node = left
	var spawn_right = bool(randi_range(0,1))
	
	if spawn_right:
		selected_side_node = right
	
	var selected_spawn_point = selected_side_node.get_node(str(selected_spawn_point_number))
	var spawn_position = selected_spawn_point.global_position
	
	var shark_instance = Shark.instantiate()
	shark_instance.global_position = spawn_position
	get_tree().current_scene.add_child(shark_instance)
	
	if spawn_right:
		shark_instance.flip_direction()
