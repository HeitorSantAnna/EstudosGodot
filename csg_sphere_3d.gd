extends CSGSphere3D

var andar = Vector3(2, 0, 0).normalized()

var r = 2

var e = 2

var soma = 200


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(soma + r * e)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("Olá mundo")
	
	if Input.is_key_pressed(KEY_D):
		#position += andar * delta
		print("Se movel para a direita")
	pass
