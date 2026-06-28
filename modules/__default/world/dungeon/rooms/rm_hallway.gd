extends DungeonRoom

## a simple hallway with a chance to spawn a chest or tap

@export var lootGen:Dictionary={"ID":"0"} 

func _ready() -> void:
	super()

func _onPreEnter():
	pass

func on_time_passed(_dt:int):
	if (!lootAvailable && (Global.main.getTime()-lastVisited>(3*60*60))):
		lootAvailable=true
		pass

func updateHudActions():
	super()
	if(lootAvailable):
		Global.hud.addButton("loot", "",lootRoom)

func lootRoom():
	lootAvailable=false
	Global.main.runScene("interaction_scene",
		["generic_looting",null,lootGen.ID],
		Global.main.getCurrentScene().uniqueSceneID)
	pass
