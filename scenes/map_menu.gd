extends Control


func _on_back_button_down():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_map_1_button_down():
	get_tree().change_scene_to_file("res://scenes/map_1.tscn")
