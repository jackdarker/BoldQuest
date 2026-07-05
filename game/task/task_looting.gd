class_name TaskLooting extends Task

var target:LootContainer

func _init() -> void:
	super()
	ID="Looting"
	duration=30*60

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg=char.getName()+" is done looting"
	else:
		_res.Msg=char.getName()+" is looting"
		
	return _res

#func interuptableByTask(_task:Task)->bool:
#	if(_task.ID=="Talking"):
#		return true
#	return false
func start():
	Global.main.processTimeUntilTaskDone()
	
func onDone():
	if char.isPlayer:
		Global.main.runScene("interaction_scene",
		["generic_looting",null,target],
		Global.main.getCurrentScene().uniqueSceneID)
