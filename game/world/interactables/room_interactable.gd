class_name RoomInteractable extends Node2D

## something someone can interact with
## 

@export var label:="some action"

func _ready() -> void:
	pass

func getAvailableActions(_char:Character)->Array[Task]:
	return []

# 0= visible, 1=hide label, 255=show nothing
func hidden()->int:
	return 0

func _enter_tree() -> void:
	position=Vector2(8,8)*getIconOffset()

## return normalized vector where the icon should be positioned in the room, f.e. (-1,1) is bottom left
func getIconOffset()->Vector2:
	return Vector2(0,0)

func get_tooltip()->String:
	return ""

func processTime(_delta:int):
	pass
