class_name RoomInteractable extends Node

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

func get_tooltip()->String:
	return ""

func processTime(_delta:int):
	pass
