extends CharacterBody3D

var dash = 2
var accel = false
var plane

func _process(delta: float) -> void:
	
	var move := Input.get_vector("LeftMoviment", "RightMoviment", "UpMoviment", "DownMoviment")
	var pos := Vector3(move.x, 0, move.y).normalized()
	
	if Input.is_action_pressed("Dash"):
		accel = true
	else:
		accel = false
	
	if Input.is_action_just_pressed("Alterar Plano"):
		plane = true
	else: if Input.is_action_just_pressed("Alterar Plano") and plane:
		plane = false
	
	if plane:
		collision_layer = 2
	else:
		collision_layer = 1
	
	if accel:
		dash = 4
	else:
		dash = 2
	
	position += pos * dash * delta
	print(position.y);
