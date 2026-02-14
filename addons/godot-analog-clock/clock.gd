extends Node3D

## Node to rotate for hour hand
@export_node_path var hour_hand = NodePath("Hour")

## Node to rotate for minute hand
@export_node_path var minute_hand = NodePath("Minute")

## Node to rotate for second hand
@export_node_path var second_hand = NodePath("Second")

var last_second: int


func _process(_delta: float) -> void:
	var time = Time.get_time_dict_from_system()
	if time.second != last_second:
		if hour_hand:
			get_node(hour_hand).rotation_degrees.z = -(360 / 12) * (time.hour % 12)
		if minute_hand:
			get_node(minute_hand).rotation_degrees.z = -(360 / 60) * time.minute
		if second_hand:
			get_node(second_hand).rotation_degrees.z = -(360 / 60) * time.second
		last_second = time.second
