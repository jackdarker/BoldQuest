class_name TaskSwitch extends Task

## toogles the state of a switch

var target:RoomInteractable

func get_label()->String:
	return ("use "+target.get_label())
	
func _init() -> void:
	super()
	ID="Switching"
	duration=1*60

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg=char.getName()+" is done switching"
	else:
		_res.Msg=char.getName()+" is switching"
		
	return _res

func start():
	Global.main.processTimeUntilTaskDone()
	
func onDone():
	if char.isPlayer:
		target.trigger(char)
			
