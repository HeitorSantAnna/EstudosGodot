extends Area2D

signal hit

@export var speed = 400
var screen_size

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	pass

func _ready() -> void:
	screen_size = get_viewport_rect().size
	
	hide()
	pass

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	var InputDir = Input.get_vector("LeftMoviment", "RightMoviment", "UpMoviment", "DownMoviment")
	
	if InputDir != Vector2.ZERO:
		velocity +=  InputDir.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.pause()
		
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "Walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	if velocity.y != 0:
		$AnimatedSprite2D.animation = "Up"
		$AnimatedSprite2D.flip_v = velocity.y > 0
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	pass


func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()

	$CollisionShape2D.set_deferred("disabled", true)
	pass
