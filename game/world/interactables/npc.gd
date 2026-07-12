class_name NPCIcon extends RoomInteractable

@export var ID:String=""

func getIconOffset()->Vector2:
	return Vector2(-1,1)
	
func getAvailableActions(_char:Character)->Array[Task]:
	var _task=TaskTalk.new()
	_task.char=Global.pc
	_task.charB=get_parent().getFloor().Mobs[ID]
	return [_task]
