extends Node3D

@export var constant_update : bool = false

var Hour : Node
var Minute : Node
var Second : Node

var last_second: int

func _ready() -> void:
	Hour = get_node("Hour")
	Minute = get_node("Minute")
	Second = get_node("Second")


func _process(_delta: float) -> void:
	var time = Time.get_time_dict_from_system()
	if time.second != last_second or constant_update:
		if Hour:
			Hour.rotation_degrees.z = -(360 / 12) * (time.hour % 12)
		if Minute:
			Minute.rotation_degrees.z = -(360 / 60) * time.minute
		if Second:
			Second.rotation_degrees.z = -(360 / 60) * time.second
		last_second = time.second
