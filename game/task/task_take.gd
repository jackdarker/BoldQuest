class_name TaskTake extends Task

var target:Pickup
func get_label()->String:
	return ("take "+target.getItem().getName())
	
func _init() -> void:
	super()
	ID="Taking"
	duration=1*60

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg=char.getName()+" is done taking"
	else:
		_res.Msg=char.getName()+" is taking"
		
	return _res

func start():
	Global.main.processTimeUntilTaskDone()
	
func onDone():
	if char.isPlayer:
		Global.main.runScene("interaction_scene",
		["generic_pickup",null,target],
		Global.main.getCurrentScene().uniqueSceneID)
