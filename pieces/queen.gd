extends KinematicBody2D


onready var nav2d = get_node("/root/Game/Nav2D")
onready var player = get_node("/root/Game/Player")

export var speed = 100

var velocity = Vector2.ZERO
var path = []
var threshold = 2

func _ready():
	get_target_path()
	
func _physics_process(delta):
	if path.size() > 0:
		move_to_target()
		
func move_to_target():
	if global_position.distance_to(path[0]) < threshold:
		path.remove(0)
	else:
		var direction = global_position.direction_to(path[0])
		velocity = direction * speed
		velocity = move_and_slide(velocity)
		
func get_target_path():
	path = nav2d.get_simple_path(global_position, player.global_position, false)
