extends Area2D
const COIN = preload("uid://eaujh0ah645w")

var isOpen = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if not isOpen:
		isOpen=true
		_spawn_coin()

func _spawn_coin()->void:
	var coin = COIN.instantiate()
	# ตอนนี้อยู่ข้างใน ก้อน Boxcoins
	add_child(coin)
	#ให้ ตน หลัก ให้ย้าย ไปอยู่ ใน ตน หลัก เดียว กับ box โดยคูณ vector ตำแหน่งให้สูงขึ้น
	coin.position = Vector2(0, -16)
	
