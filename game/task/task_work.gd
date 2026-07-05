class_name TaskWork extends Task

func _init() -> void:
	super()
	ID="Working"
	duration=120*60

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg=char.getName()+" is done working"
	else:
		_res.Msg=char.getName()+" is working"
		
	return _res

#func interuptableByTask(_task:Task)->bool:
#	if(_task.ID=="Talking"):
#		return true
#	return false
