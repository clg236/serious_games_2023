extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
onready var canMove = true;

export (int) var speed = 30

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if(canMove):
		if Input.is_action_pressed("ui_left"):
			velocity.x += 1
			_animated_sprite.play("walkR")
		elif Input.is_action_pressed("ui_right"):
			velocity.x -= 1
			_animated_sprite.play("walkL")
		elif Input.is_action_pressed("ui_down"):
			velocity.y += 1
			_animated_sprite.play("walkF")
		elif Input.is_action_pressed("ui_up"):
			velocity.y -= 1
			_animated_sprite.play("walkB")
		velocity = velocity.normalized() * speed
	if(!canMove):
		if Input.is_action_pressed("ui_accept"):
			canMove = true

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	var collision := move_and_collide(velocity * delta)
	if collision != null:
		var body := collision.collider
		if body.name == "witch":
			get_tree().change_scene("GameOver.tscn")
		if body.name == "stone":
			print("entered")
