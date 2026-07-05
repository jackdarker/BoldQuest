class_name TaskRest extends Task

func _init() -> void:
	super()
	ID="Resting"
	duration=60*60

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg=char.getName()+" is done with sleeping"
	else:
		_res.Msg=char.getName()+" is asleep"
		
	return _res
