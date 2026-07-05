class_name ActionLooting extends RoomAction

@export var container_label:String= "a small box"
@export var ID:String

func _ready() -> void:
	super()
	if(label=="" || label=="some action"):
		label= "loot "+container_label

func can_run()->Result:
	var _res:Result=Result.create(true,"")
	return _res

func run():
	#Global.main.runScene("interaction_scene",
	#	["generic_looting",null,ID],
	#	Global.main.getCurrentScene().uniqueSceneID)
	Global.pc.assignTask(TaskLooting.new())
	Global.main.processTimeUntilTaskDone()
