class_name Character extends Node

var location:String = ""
var faction:String = ""
var uniqueID:String = ""		#name on screen like crab #5
var ID:String = "Unknown":		# just crab
	set(value):
		if(ID!=value && value!=""):
			uniqueID=value
			ID=value
var isPlayer:=false		
var status:StatusList
var effects:EffectsList
var inventory:Inventory
var outfit:Outfit
var skills:Inventory
var combatAI:CombatAIBase = null		#controlled by player if this is null
var task:Task
var prevTask:Task
var interruptedTask:Task
var despawn:bool=false	#this was spawned in combat and should despawn

func _init():
	task=null
	inventory=Inventory.new()
	inventory.user=(self)
	outfit=Outfit.new()
	outfit.user=(self)
	status=StatusList.new()
	status.addItem(Status.create(StatEnum.Pain,0,0,60))
	status.addItem(Status.create(StatEnum.Fatigue,0,0,100))
	status.addItem(Status.create(StatEnum.Lust,0,0,60))
	effects=EffectsList.new()
	effects.user=(self)
	skills= Inventory.new()
	skills.user=(self)
	skills.addItem(GR.createSkill("Skill_Punch"))
	
func getName()->String:
	return (uniqueID)

#override this !
func getBustImage()->Texture2D:
	return load("res://assets/images/icons/ic_unknown.svg")


func getStat(key)->Status:
	return status.getItemByID(key)

# dead or passed out
func isKnockedOut()->bool:
	if(getStat(StatEnum.Pain).atUL):
		return(true)
	if(getStat(StatEnum.Lust).atUL):
		return(true)
		
	return(false)


func processTime(_delta:int):
	for item in effects.getItems():
		item.processTime(_delta)
	if(task):
		task.processTime(_delta)
		Global.hud.say(task.getResult().Msg)	#todo scene should render
		if(task.result!=Task.TASKRESULT.ONGOING):
			assignTask(null)
	else:
		think()

func think():
	pass

func assignTask(_newtask:Task, owner:bool=true):
	if(!task && interruptedTask):
		#if there is a inter.task memorize that one instead
		prevTask=interruptedTask
		interruptedTask=null #.free() not necess?
		
	if(task && task.result!=Task.TASKRESULT.ONGOING):
		#actual task done, store in memory
		prevTask=null #.free() not necess?
		prevTask=task
	elif(task && task.result==Task.TASKRESULT.ONGOING):
		#actual task ongoing, mark as interupted
		interruptedTask=task
	
	task=_newtask
	if(task && owner):
		task.char=self
		task.start()

func interuptableByTask(_task:Task)->bool:
	if(!task):
		return true
	return false

func interuptTask():
	if(task):
		task.result=Task.TASKRESULT.PAUSED
		interruptedTask=task
	task=null
	
func abortTask():
	if(task):
		task.result=Task.TASKRESULT.ABORTED
		prevTask=task
	task=null

# region load/save
func loadData(data):
	location=data["location"]
	ID=data["id"]
	uniqueID=data["uid"]
	inventory.loadData(data["inv"])
	outfit.loadData(data["outfit"])
	status.loadData(data["status"])
	effects.loadData(data["effects"])
			
func saveData()->Variant:
	var data ={
		"id":ID,
		"uid":uniqueID,
		"location":location,
		"inv":inventory.saveData(),
		"outfit":outfit.saveData(),
		"status":status.saveData(),
		"effects":effects.saveData(),
	}
	return(data)
#endregion
