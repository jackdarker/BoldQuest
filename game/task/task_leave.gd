class_name TaskLeave extends Task

var target:String

func _init() -> void:
	super()
	ID="Leaving"
	duration=1*60

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg=char.getName()+" is now in "+target
	else:
		_res.Msg=char.getName()+" is moving to "+target
		
	return _res

func onDone():
	Global.main.runScene(target)
