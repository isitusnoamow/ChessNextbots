extends KinematicBody2D

export (int) var speed = 80
export var updateTime = 0.1
var score = 0
var stamina = 100

onready var timer = $Timer
onready var DangerZone = $DangerZone
onready var dead = $Area2D
onready var text = $RichTextLabel

var velocity = Vector2()

signal death
signal safety
signal danger

func _ready():
	Global.player = self
	timer.wait_time = updateTime
	timer.start()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	check_death()
	velocity = move_and_slide(velocity)

func check_death():
	if dead.get_overlapping_bodies().size() > 2:
		emit_signal("death")

func _on_Timer_timeout():
	if DangerZone.get_overlapping_bodies().size() > 2:
		emit_signal("danger")
	else:
		emit_signal("safety")


func _on_Life_timeout():
	score += 1
	text.bbcode_text = "[center]Time: " + String(score) + "[/center]"
