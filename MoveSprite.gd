extends Sprite2D

var speed = 10
var angular_speed = PI

func _init() -> void:
	print("Hello, World!!!")


func _process(delta: float) -> void:
	
	#Aqui está fazendo o player rotacionar a partir do centro dele
	#rotation += angular_speed * delta

	#Aqui vai fazer o player rotacionar a partir de um centro, ele vai fazer um circulo
	#var velocity = Vector2.UP.rotated(rotation) * speed
	#position += velocity
	
	var moveup := Input.get_vector("LeftMoviment", "RightMoviment", "UpMoviment", "DownMoviment")
	var direction := (Vector2(moveup.x, moveup.y).normalized())
	
	position += direction * 20
