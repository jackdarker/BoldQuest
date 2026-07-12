class_name RoomExit extends RoomInteractable

@export var target:String	#this is some scene

func _ready() -> void:
	super()
	if(label=="" || label=="some action"):
		label= "goto "+target

func getIconOffset()->Vector2:
	return Vector2(-1,-1)

func getAvailableActions(_char:Character)->Array[Task]:
	var _task=TaskLeave.new()
	_task.target=target
	return [_task]
