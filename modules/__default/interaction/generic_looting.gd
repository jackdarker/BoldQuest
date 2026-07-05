extends SceneExtension

const sceneID="generic_looting"
var loot:=[]

func on_setupScene():
	loot=self.parent_scene.args[0].getLoot()

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
