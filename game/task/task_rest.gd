class_name TaskRest extends Task

func _ready() -> void:
	ID="Resting"
	duration=60*60
	pass

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg="the NPC is done with sleeping"
	else:
		_res.Msg="the NPC is asleep"
		
	return _res
