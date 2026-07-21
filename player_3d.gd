extends CharacterBody3D

@export var speed = 14

@export var fall_aceleration = 75

@export var jump_impulse = 20

@export var bounce_impulse = 16

var target_velocity = Vector3.ZERO

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("LeftMoviment", "RightMoviment", "UpMoviment", "DownMoviment")
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		var direction3D = Vector3(direction.x, 0, direction.y)
		$Pivot.basis = Basis.looking_at(direction3D)
	
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.y * speed
	
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_aceleration * delta)
	
	if is_on_floor() and Input.is_action_just_pressed("Jump"):
		target_velocity.y = jump_impulse
	
	velocity = target_velocity
	
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)
		
		if collision.get_collider() == null:
			continue
		
		if collision.get_collider().is_in_group("Mobs3D"):
			var mob = collision.get_collider()
			
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				mob.squash()
				target_velocity.y = bounce_impulse
				
				break
	
	move_and_slide()
	pass
