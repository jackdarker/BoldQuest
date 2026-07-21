extends SceneExtension

const sceneID="generic_struggling"

var trap:SnareTrap
var loose:=0

func on_setupScene():
	trap=self.parent_scene.args[0]
	loose=0

		
func get_buttons(menuid:String,buttons:Array):
	if(menuid==""):
		Global.hud.say("You are trapped.")
	if(menuid=="escaped"):
		Global.hud.say("Finally you escaped the trap")
		buttons.push_back(Button_Config.new("Leave","",Global.main.removeScene.bind(parent_scene)))
	else:
		if(menuid=="fail"):
			pass
		if(menuid=="pass"):
			pass
		if(menuid=="rest"):
			pass
		buttons.push_back(Button_Config.new("Struggle","",struggle))
		buttons.push_back(Button_Config.new("Keep still","",dontStruggle))
	
	return(buttons)

func dontStruggle():
	Global.hud.say("Taking a breather.")
	Global.main.doTimeProcess(5*60)
	cb_menu("rest",true).call()

func struggle():
	Global.hud.say("You struggle against the traps hold on you.")
	loose+=35
	Global.main.doTimeProcess(5*60)
	if (loose>100):
		cb_menu("escaped",true).call()
	else:
		cb_menu("pass",true).call()
	
	
