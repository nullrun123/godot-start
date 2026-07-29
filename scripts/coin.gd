
extends Area2D
#@onready var game_manger: Node = %GameManger

signal count

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	Ui_manager.new().add_point()
	count.emit()
	animation_player.play("pickup")
