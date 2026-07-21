class_name SnareTrap extends RoomInteractable

## the trap triggers automatically, the game fires event onEnterRoom and forces a struggle-task on the player

var timeSinceDefused:=0
@export var primeTime:=60*60
@export var maxThoughness:=100
var thougness:=0
var victim:Character

func _ready() -> void:
	super()
	#set_hidden(255)	TODO traps are hidden
	if(label=="" || label=="some action"):
		label= "trap"

func getIconOffset()->Vector2:
	return Vector2(1,-1)
	

func getAvailableActions(_char:Character)->Array[Task]:
	var _task
	var _task2
	if(_char==victim):
		_task= TaskStruggling.new()
		_task.target=self
		_task2= TaskStruggling.new()
		_task2.target=self
		_task.keepQuiet=true
		return [_task,_task2]
	else:
		_task= TaskSwitch.new()
		_task.target=self
	return [_task]

func processTime(_delta:int):
	if(timeSinceDefused>0 && ((Global.main.getTime()-timeSinceDefused)>primeTime)):
		timeSinceDefused=-1
		self.set_hidden(0)

func trigger(who:Character):
	GR.createEffect("eff_trapped").applyTo(who)	#the eff is used to block other actions
	thougness=maxThoughness
	victim=who
	Global.hud.say("You triggered a trap")
	Global.main.getCurrentScene().menu("",true)

func escaped(who:Character):
	who.effects.removeItemID("eff_trapped")
	#who.abortTask()
	victim=null
	Global.hud.say("You escaped from the trap")
	Global.main.getCurrentScene().menu("",true)
