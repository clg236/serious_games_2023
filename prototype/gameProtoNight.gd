extends Node2D

onready var gameT = OS.get_ticks_msec()

func _process(delta):
	$CanvasLayer/Label.text = get_time()

func get_time():
	var current_time = OS.get_ticks_msec()-gameT;
	var minutes = current_time/1000/60
	var seconds = current_time/1000%60
	var msec = current_time%1000/100
	return str(2-minutes)+":"+str(59-seconds)+":"+str(9-msec)
