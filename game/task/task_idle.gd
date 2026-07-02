class_name TaskIdle extends Task

## NPC lurks around
func _ready() -> void:
	ID="Idle"
	duration=20*60
	pass

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg="the NPC is done idling"
	else:
		_res.Msg="the NPC is idle"
		
	return _res
