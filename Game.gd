extends Node2D

onready var cm = $CanvasModulate

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_death():
	get_tree().change_scene("res://GameOver.tscn")

func _on_Player_danger():
	cm.color = Color(1,0,0,1)

func _on_Player_safety():
	cm.color = Color(0,0,0,1)
