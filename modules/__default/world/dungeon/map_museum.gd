extends DungeonFloor


func _ready() -> void:
	super()
	var _char=MobLizardman.new()
	_char.location="MuseumExhibit1"
	Mobs[_char.uniqueID]=_char
