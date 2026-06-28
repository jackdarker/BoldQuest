class_name ActionWait extends RoomAction

func _ready() -> void:
	super()
	if(label=="" || label=="some action"):
		label= "rest"

func can_run()->Result:
	var _res:Result=Result.create(true,"")
	return _res

func run():
	# 
	Global.main.doTimeProcess(5*60)
	Global.main.runScene("interaction_scene",
		["generic_rest",null,get_parent().roomID],
		Global.main.getCurrentScene().uniqueSceneID)
