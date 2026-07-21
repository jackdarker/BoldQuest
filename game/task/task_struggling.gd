class_name TaskStruggling extends Task

## if the player is trapped he has to struggle until released
## see SnareTrap-Interactable; the Trap-Event triggers this task and if struggle is unsucessful retriggers

var target:SnareTrap
var keepQuiet:=false

func get_label()->String:
	if keepQuiet:
		return ("dont move")
	else:
		return ("struggle out of "+target.label)

func _init() -> void:
	super()
	ID="Struggling"
	duration=5*60

func getResult()->Result:
	var _res:=Result.create(true,"")
	if(result==TASKRESULT.DONE):
		pass#_res.Msg=char.getName()+" is struggling"	#struggle scene will tell if escaped 
		
	return _res

func start():
	Global.main.processTimeUntilTaskDone()

	
func onDone():
	if keepQuiet:
		target.thougness+=5
		Global.hud.say(char.getName()+" trys to keep quiet")
	else:
		Global.hud.say(char.getName()+" is struggling")
		target.thougness-=35
	if(target.thougness<0):
		target.escaped(self.char)
	Global.main.getCurrentScene().menu("",true)    need to move this to processTime
	#if char.isPlayer:
	#	Global.main.runScene("interaction_scene",
	#	["generic_struggling",null,target],
	#	Global.main.getCurrentScene().uniqueSceneID)
