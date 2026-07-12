extends SceneExtension

const sceneID="generic_looting"
var loot:=[]
var PickupScene=preload("res://game/world/interactables/pickup.tscn")

func on_setupScene():
	loot=self.parent_scene.args[0].getLoot() #lootcontainer
	if(true): # TODO if no trap we skip scene
		parent_scene.force_exit=true
		var _room=parent_scene.args[0].get_parent() # room node
		for _item:ItemBase in loot:
			var _pickup:=PickupScene.instantiate()
			_pickup.item=_item
			_room.add_child(_pickup)
		
func get_buttons(menuid:String,buttons:Array):
	if(menuid==""):
		Global.hud.say("There is some loot... ")
		if(loot.size()>0):
			for _item in loot:
				buttons.push_back(Button_Config.new(_item.getName(),"",pickup.bind(_item)))
		else:
			Global.hud.say("There is nothing inside ")
			buttons.push_back(Button_Config.new("Leave","",Global.main.removeScene.bind(parent_scene)))
	return(buttons)

func pickup(item):
	loot.erase(item)
	Global.pc.inventory.addItem(item)
	cb_menu("").call()
