extends Area2D
var speed = 300.0
var score: int = 0
func _process(delta):
	var direction = Vector2.ZERO
	direction.y += 1
	var new_position = position + direction * speed * delta
	position = new_position
