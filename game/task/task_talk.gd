class_name TaskTalk extends Task

# assign to charB !
var isStarted:=false

func _init() -> void:
	super()
	ID="Talking"
	duration=30*60

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg=char.getName()+" is done talking"
	else:
		_res.Msg=char.getName()+" is talking"
		
	return _res

func start():
	isStarted=true
	Global.main.runScene("interaction_scene",["dlg_pc_npc",null,char,charB],Global.main.currentSceneUID)

func processTime(_delta:int):
	if(result!=TASKRESULT.ONGOING):
		return
	progress=min(duration,progress+_delta)
	if(progress>=duration):
		result=TASKRESULT.DONE
		onDone()
	pass
