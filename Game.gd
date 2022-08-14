extends Node2D

onready var nav2d : Navigation2D = $Navigation2D
onready var enemy = $Wqueen
onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	if Input.is_action_just_pressed("ui_accept"):
		var newpath = nav2d.get_simple_path(enemy.global_position,player.global_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
