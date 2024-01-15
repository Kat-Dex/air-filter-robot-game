extends Node2D

var mobs = [
	preload("res://mob scenes/bee.tscn"),
	preload("res://mob scenes/birb.tscn"),
	preload("res://mob scenes/paper_plane.tscn"),
	preload("res://mob scenes/smoke.tscn")
]

var spawn_area_min = Vector2(0, 0)
var spawn_area_max = Vector2(1000, 0)

func _ready():
	$GameTimer.start()
	spawn_mobs()

func spawn_mobs():
	while $GameTimer.time_left > 0:
		var random_mob_scene = mobs[randi() % mobs.size()]
		var mob = random_mob_scene.instantiate()
		var random_x = randf_range(spawn_area_min.x, spawn_area_max.x)
		mob.position = Vector2(random_x, 0)
		mob.add_to_group("mobs_group")
		add_child(mob)
		await get_tree().create_timer(0.5).timeout

func _on_GameTimer_timeout():
	print("Game Over!")
