class_name Pickup extends RoomInteractable

@export var itemRef:GDScript
var item:ItemBase

func getIconOffset()->Vector2:
	return Vector2(1,-1)
	
func getAvailableActions(_char:Character)->Array[Task]:
	var _task=TaskTake.new()
	_task.target=self
	return [_task]

func getItem()->ItemBase:
	if(!item):
		item=itemRef.new()
	return item
