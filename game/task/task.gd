class_name Task extends Node

## NPC pick a task and execute them until done, interuppted or aborted
enum TASKTYPE {NONE=0}
enum TASKRESULT { ONGOING=0, DONE=1, ABORTED=2, PAUSED=3}

var ID:String
var progress:int=0
var duration:int=10*60
var result:=TASKRESULT.ONGOING
var deleteMe:bool=false

var wrefCharacter:WeakRef=null
var char:Character:
	set(value):
		wrefCharacter=weakref(value)
	get:
		return(wrefCharacter.get_ref())

func _ready() -> void:
	pass

func start():
	progress=0
	result=TASKRESULT.ONGOING
	pass

func abort():
	pass


func processTime(_delta:int):
	if(result!=TASKRESULT.ONGOING):
		return
	progress=min(duration,progress+_delta)
	if(progress>=duration):
		result=TASKRESULT.DONE
	pass

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		_res.Msg="Task done"
	else:
		_res.Msg="Task unfinished"
		
	return _res
