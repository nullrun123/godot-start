extends Node2D

const SPEED = 60
var knockback_target: Node2D = null
var knockback_dir := Vector2.ZERO
var knockback_speed := 200.0
var isdied = false
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animation_slime: AnimationPlayer = $AnimationSlime
@onready var killzone: Area2D = $Killzone

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# เอามาเดินกลับด้าน 
var direction = 1

func _process(delta):
	if not isdied:
#		เมื่อ ด้านขวา ชนสักอย่าง หนึง ไหม
		if ray_cast_right.is_colliding():
			direction = -1
			animated_sprite.flip_h = true
	
		#	เมื่อ ด้านซ้าย ชนสักอย่าง หนึง ไหม
		if ray_cast_left.is_colliding():
			direction = 1
			animated_sprite.flip_h = false
		#movement * delta จะเป็นการขึนอยุ่กับ fps
		position.x+= direction * SPEED *delta
		
	


func _on_atkzone_body_entered(body: Node2D) -> void:
		isdied = true
		killzone.set_deferred("monitoring", false)
		animation_slime.play("slime_atk")
		var dir = (body.global_position - global_position).normalized()
		if body.has_method("knockback"):	
			body.knockback()
