extends Node

@export var mob_scene: PackedScene

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	var player_position = $Player3D.position
	mob.initialize(mob_spawn_location.position, player_position)
	
	add_child(mob)
	pass
