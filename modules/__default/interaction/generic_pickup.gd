extends SceneExtension

const sceneID="generic_pickup"
var item:ItemBase

func on_setupScene():
	item=self.parent_scene.args[0].getItem()	#Pickup
	if(true):	#TODO
		parent_scene.force_exit=true
		Global.pc.inventory.addItem(item)
		parent_scene.args[0].get_parent().remove_child(self.parent_scene.args[0])
		
func get_buttons(menuid:String,buttons:Array):
	if(menuid==""):
			Global.hud.say("There is nothing more ")
			buttons.push_back(Button_Config.new("Leave","",Global.main.removeScene.bind(parent_scene)))
	return(buttons)
