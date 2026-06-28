extends Sprite2D

var moviment

var Dirotation

var pi = PI

var speed = 300

func _process(delta: float) -> void:
	moviment = Input.get_axis("DownMoviment", "UpMoviment")
	
	Dirotation = Input.get_axis("LeftMoviment", "RightMoviment")
	
	rotation += pi * Dirotation * delta
	
	position += Vector2.UP.rotated(rotation) * moviment * speed * delta
