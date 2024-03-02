extends Area2D

var label : Label

func _ready():
	label = $Label
	label.visible = false


func _on_collision_shape_2d_child_entered_tree(body):
	if body.name == "CharacterBody2D":
		label.visible = true

func _on_collision_shape_2d_child_exiting_tree(body):
	if body.name == "CharacterBody2D":
		label.visible = false
