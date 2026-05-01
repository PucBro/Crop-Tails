extends Sprite2D


@onready var damage_component: DamageComponent = $DamageComponent
@onready var hurt_component: HurtComponent = $HurtComponent

var log_scene = preload("res://scenes/objects/trees/log.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func on_hurt(damage: int)-> void:
	damage_component.apply_damage(damage)
	material.set_shader_parameter("shake_intensity", 0.7)
	await get_tree().create_timer(1.0).timeout
	material.set_shader_parameter("shake_intensity", 0.0)
func on_max_damage_reached()->void:
	call_deferred("add_log_scene")
	queue_free()
	
func add_log_scene()-> void:
	var log_instance_1 = log_scene.instantiate()
	var log_instance_2 = log_scene.instantiate()
	log_instance_1.global_position = global_position
	log_instance_2.global_position = global_position + (Vector2.UP*10)
	get_parent().add_child(log_instance_1)
	get_parent().add_child(log_instance_2)
