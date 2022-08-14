extends KinematicBody2D

export var speed = 30
onready var player = get_node("/root/Game/Player")
# Called when the node enters the scene tree for the first time.
var velocity = Vector3.ZERO

func _ready():
	pass # Replace with function body.

func _process(delta):
	if global_position.distance_to(player.global_position) > 2:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		velocity = move_and_slide(velocity)
		
