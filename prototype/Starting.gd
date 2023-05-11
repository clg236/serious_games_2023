extends Node2D

onready var _animated_sprite = $hole
onready var button = $Button

# Called when the node enters the scene tree for the first time.
func _ready():
	button.connect("pressed", self, "_button_pressed")
	_animated_sprite.connect('animation_finished', self, "switchScene")

func _button_pressed():
		_animated_sprite.play("default")
		$AnimatedSprite2.hide();
		
func switchScene():
	get_tree().change_scene("res://scenes/gameProto.tscn")
