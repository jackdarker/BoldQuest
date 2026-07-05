class_name TaskIdle extends Task

## NPC lurks around
func _init() -> void:
	super()
	ID="Idle"
	duration=20*60
	pass

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg=char.getName()+" is done idling"
	else:
		_res.Msg=char.getName()+" is idle"
		
	return _res
