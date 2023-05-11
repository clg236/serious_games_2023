extends KinematicBody2D

var speed = 50
onready var player = get_parent().get_node("oswald")
onready var sprite = $AnimatedSprite

func _physics_process(delta):
	#if target:
	var player_direction = global_position.direction_to(player.global_position)
	#position of player minus enemy position will give us direction
	var dir = player.position - position

	#get angle from direction (Note roation is in radians)  
	get_node("AnimatedSprite").rotation = dir.angle()
	move_and_slide(player_direction * speed)
	sprite.flip_v = global_position > player.global_position
