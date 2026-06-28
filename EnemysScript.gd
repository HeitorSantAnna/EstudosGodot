extends Sprite2D

var direction

var timer = 0

const MeuObjeto = preload("res://enemysScene.tscn")

var objetoinstanciado

func _ready() -> void:
	objetoinstanciado = MeuObjeto.instantiate()
	pass


func _process(delta: float) -> void:
	timer += delta
	
	if timer >= 3:
		_direction_moviment()
		timer = 0
	pass

func _direction_moviment() -> void:
	var rdnx = randf() * 100
	
	var rdny = randf() * 100
	
	print(rdnx)
	
	print(rdny)
	
	objetoinstanciado.position = Vector2(rdnx, rdny)
	
	add_child(objetoinstanciado)
	pass
