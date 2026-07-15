class_name Task extends RefCounted

## NPC pick a task and execute them until done, interuppted or aborted
enum TASKTYPE {NONE=0}
enum TASKRESULT { ONGOING=0, DONE=1, ABORTED=2, PAUSED=3}

var ID:String
var progress:int=0
var duration:int=10*60
var result:=TASKRESULT.ONGOING
var deleteMe:bool=false

func get_label()->String:
	return ID

func get_tooltip()->String:
	return ""

var wrefCharacter:WeakRef
var char:Character:
	set(value):
		wrefCharacter=weakref(value)
	get:
		if(wrefCharacter):
			return(wrefCharacter.get_ref())
		else:
			return null

var wrefCharacterB:WeakRef
var charB:Character:
	set(value):
		wrefCharacterB=weakref(value)
	get:
		if(wrefCharacterB):
			return(wrefCharacterB.get_ref())
		else:
			return null

func _init() -> void:
	progress=0
	result=TASKRESULT.ONGOING

func start():
	pass

func processTime(_delta:int):
	if(result!=TASKRESULT.ONGOING):
		return
	progress=min(duration,progress+_delta)
	if(progress>=duration):
		result=TASKRESULT.DONE
		onDone()
	pass

func canRun()->Result:
	var _res:Result=Result.create(true,"")
	return _res

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg="Task done"
	else:
		_res.Msg="Task unfinished"
		
	return _res

func onDone():
	pass
