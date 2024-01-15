extends CharacterBody2D

var speed = 400.0
var xmin = 0
var xmax = 1152
var ymin = 500
var ymax = 600
var score: int = 0

# Movement
func _process(delta):
	var direction = Vector2.ZERO
	move_and_slide()
	
	if Input.is_action_pressed("move_down"):
		direction.y += 1
		
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
		
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	var new_position = position + direction * speed * delta
	new_position.x = clamp(new_position.x, xmin, xmax)
	new_position.y = clamp(new_position.y, ymin, ymax)
	position = new_position


func _on_area_2d_area_entered(area):
	if area.is_in_group("mobs_group"):
		if area.is_in_group("good"):
			score += 1
		else:
			score -= 1
		area.queue_free()
