class_name RoomInteractable extends Node2D

## something someone can interact with
## 

@export var label:="some action"

func get_label()->String:
	return label

func _ready() -> void:
	pass

func getAvailableActions(_char:Character)->Array[Task]:
	return []

# 0= visible, 1=hide label, 255=show nothing
var _hidden:int=0
func get_hidden()->int:
	return _hidden

func set_hidden(value:int):
	_hidden=value
	visible=(_hidden==0)

func _enter_tree() -> void:
	position=Vector2(8,8)*getIconOffset()

## return normalized vector where the icon should be positioned in the room, f.e. (-1,1) is bottom left
func getIconOffset()->Vector2:
	return Vector2(0,0)

func get_tooltip()->String:
	return ""

func processTime(_delta:int):
	pass
