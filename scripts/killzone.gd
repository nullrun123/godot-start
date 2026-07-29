extends Area2D

@onready var timer: Timer = $Timer

# ถ้ามี body ไหนมาชน
func _on_body_entered(body: Node2D) -> void:
	print("You Died")
	Engine.time_scale = 0.5
	#ให้ลบ CollisionShape2D ออกไป ของ player แล้ว ล่วงไป
	body.get_node("CollisionShape2D").queue_free()
	#เริ่มจับเวลา
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	#restart game
	get_tree().reload_current_scene()
