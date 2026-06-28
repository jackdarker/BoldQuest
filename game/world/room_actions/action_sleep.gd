class_name ActionSleep extends RoomAction

@export var ID:String

func _ready() -> void:
	super()
	if(label=="" || label=="some action"):
		label= "sleep"

func can_run()->Result:
	var _res:Result=Result.create(true,"")
	_res.OK=false
	_res.Msg="You cant sleep here, its not save."
	return _res

func run():
	Global.main.runScene("interaction_scene",
		["generic_sleep",null,ID],
		Global.main.getCurrentScene().uniqueSceneID)
