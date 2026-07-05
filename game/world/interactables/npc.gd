class_name NPCIcon extends RoomInteractable

@export var ID:String=""


func getAvailableActions(_char:Character)->Array[Task]:
	var _task=TaskTalk.new()
	_task.char=Global.pc
	_task.charB=get_parent().getFloor().Mobs[ID]
	return [_task]
