class_name ActionButton extends RoomAction


func _ready() -> void:
	super()
	if(label=="" || label=="some action"):
		label= "use this button "

func can_run()->Result:
	var _res:Result=Result.create(true,"")
	return _res

func run():
	var _room=get_parent()
