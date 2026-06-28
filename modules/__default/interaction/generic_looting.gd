extends SceneExtension

const sceneID="generic_looting"
var lootableID:String

func on_enterScene():
	lootableID=self.parent_scene.args[0]
	pass

func get_buttons(menuid:String,buttons:Array):
	if(menuid==""):
		Global.hud.say("There is nothing inside "+lootableID)
		buttons.push_back(Button_Config.new("Leave","",Global.main.removeScene.bind(parent_scene)))
	return(buttons)
